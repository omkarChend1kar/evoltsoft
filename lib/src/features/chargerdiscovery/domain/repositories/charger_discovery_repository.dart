import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/network/network_info.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class ChargerDiscoveryRepository {
  /// Fetches a list of charging stations based on location and filters.
  Future<Either<Failure, List<ChargingStationEntity>>> getNearbyChargers({
    required double latitude,
    required double longitude,
    double radius = 5000, // Default 5 km
    List<ConnectorEntity>? connectorTypes,
    bool? onlyAvailable, // Show only available stations
  });

  /// Searches for charging stations by keyword.
  Future<Either<Failure, List<ChargingStationEntity>>> searchChargers(
    String query,
  );

  /// Fetches charging stations based on dynamic filters.
  Future<Either<Failure, List<ChargingStationEntity>>> filterChargers({
    required Map<String, dynamic> filters,
  });
}

