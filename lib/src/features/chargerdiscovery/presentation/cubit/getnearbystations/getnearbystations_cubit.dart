import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/dtos/charging_station_dto.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/usecases/get_nearby_chargers_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'getnearbystations_state.dart';

@injectable
class GetNearByStationsCubit extends Cubit<GetNearByStationsState> {
  final GetNearbyChargersUsecase getNearbyChargersUsecase;
  GetNearByStationsCubit(this.getNearbyChargersUsecase)
    : super(GetNearByStationsInitial());

  final Random _random = Random();

  Future<void> getNearbyChargingStations() async {
    emit(GetNearByStationsLoading());

    try {
      // Fetch user location
      Position position = await _getUserLocation();
      LatLng userLocation = LatLng(position.latitude, position.longitude);

      final result = await getNearbyChargersUsecase(
        Params(
          latitude: userLocation.latitude,
          longitude: userLocation.longitude,
        ),
      );

      final chargingStationIcon = await BitmapDescriptor.asset(
        ImageConfiguration(),
        'assets/images/flash_icon_64x64.png',
      );
      result?.fold(
        (l) {
          emit(GetNearByStationsError(failure: l));
        },
        (stations) {
          final stationDTOs =
              stations
                  .map((entity) => ChargingStationDTO.fromEntity(entity))
                  .toList();
          Set<Marker> markers = _generateMarkers(
            stationDTOs,
            chargingStationIcon,
          );
          emit(
            GetNearByStationsComplete(
              stations: stationDTOs,
              markers: markers,
              userLocation: userLocation,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        GetNearByStationsError(
          failure: ServerFailure(
            message: "Error fetching charging stations: $e",
          ),
        ),
      );
    }
  }

  Future<Position> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception("Location services are disabled.");

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      throw Exception("Location permissions are permanently denied.");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Set<Marker> _generateMarkers(
    List<ChargingStationDTO> stations,
    AssetMapBitmap chargingStationIcon,
  ) {
    return stations.map((station) {
      return Marker(
        markerId: MarkerId(station.id.toString()),
        position: LatLng(station.latitude, station.longitude),
        infoWindow: InfoWindow(title: station.name, snippet: station.address),
        icon: chargingStationIcon,
      );
    }).toSet();
  }
}
