import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/network/network_info.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/data/datasources/remote/charger_discovery_remotedatasource.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/repositories/charger_discovery_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChargerDiscoveryRepository)
class ChargerDiscoveryRepositoryImpl extends ChargerDiscoveryRepository {
  final NetworkInfo networkInfo;

  final ChargerDiscoveryRemotedatasource remotedatasource;
  ChargerDiscoveryRepositoryImpl(
    this.remotedatasource, {
    required this.networkInfo,
  });
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
        await remotedatasource.getNearbyChargers(
          latitude: latitude,
          longitude: longitude,
        ),
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

