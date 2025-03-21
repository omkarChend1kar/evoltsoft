import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/network/network_info.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/repositories/charger_discovery_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChargerDiscoveryRepository)
class ChargerDiscoveryRepositoryImpl extends ChargerDiscoveryRepository {
  final NetworkInfo networkInfo;

  ChargerDiscoveryRepositoryImpl({required this.networkInfo});
  @override
  Future<Either<Failure, List<ChargingStationEntity>>> filterChargers({
    required Map<String, dynamic> filters,
  }) {
    // TODO: implement filterChargers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChargingStationEntity>>> getNearbyChargers({
    required double latitude,
    required double longitude,
    double radius = 5000,
    List<ConnectorEntity>? connectorTypes,
    bool? onlyAvailable,
  }) async {
    try {
      final isNetworkConnected = await networkInfo.isConnected;
      if (isNetworkConnected == null || !isNetworkConnected) {
        return const Left(NetworkFailure(message: 'No internet Connection'));
      }
      return Right(
        await _generateChargingStations(LatLng(latitude, longitude)),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(message: error.errorMessage, code: error.errorCode),
      );
    }
  }

  @override
  Future<Either<Failure, List<ChargingStationEntity>>> searchChargers(
    String query,
  ) {
    // TODO: implement searchChargers
    throw UnimplementedError();
  }
}

LatLng _generateRandomNearbyLocation(LatLng center, double radiusInMeters) {
  final Random random = Random();
  const double earthRadius = 6371000;
  double randomAngle = random.nextDouble() * 2 * pi;
  double randomDistance = random.nextDouble() * radiusInMeters;

  double deltaLatitude = (randomDistance / earthRadius) * (180 / pi);
  double deltaLongitude =
      (randomDistance / earthRadius) *
      (180 / pi) /
      cos(center.latitude * pi / 180);

  return LatLng(
    center.latitude + deltaLatitude * cos(randomAngle),
    center.longitude + deltaLongitude * sin(randomAngle),
  );
}

Future<List<ChargingStationEntity>> _generateChargingStations(
  LatLng userLocation,
) async {
  List<ChargingStationEntity> stations = [];
  List<String> connectorTypes = [
    "CCS",
    "CHAdeMO",
    "Type2",
    "Tesla Supercharger",
  ];

  for (int i = 0; i < 5; i++) {
    LatLng stationLocation = _generateRandomNearbyLocation(userLocation, 2000);
    List<ConnectorEntity> connectors = List.generate(
      Random().nextInt(3) + 1, // Generate 1 to 3 connector types per station
      (index) {
        String type = connectorTypes[Random().nextInt(connectorTypes.length)];
        int totalPlugs = Random().nextInt(5) + 1;
        int availablePlugs = Random().nextInt(totalPlugs + 1);
        return ConnectorEntity(
          type: type,
          powerCapacity:
              Random().nextDouble() * (350 - 50) + 50, // 50kW to 350kW
          totalPlugs: totalPlugs,
          availablePlugs: availablePlugs,
        );
      },
    );

    stations.add(
      ChargingStationEntity(
        id: 'station_$i',
        name: 'Charging Station ${i + 1}',
        address: 'Some address $i',
        latitude: stationLocation.latitude,
        longitude: stationLocation.longitude,
        connectors: connectors,
        openHours: '24/7',
        imageUrl: 'some_url',
      ),
    );
  }
  return stations;
}
