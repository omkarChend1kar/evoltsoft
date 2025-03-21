import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';

abstract class ChargerDiscoveryRemotedatasource {
  /// Fetches a list of charging stations based on location and filters.
  Future<List<ChargingStationEntity>> getNearbyChargers({
    required double latitude,
    required double longitude,
    double radius = 5000, // Default 5 km
    List<ConnectorEntity>? connectorTypes,
    bool? onlyAvailable, // Show only available stations
  });

  /// Searches for charging stations by keyword.
  Future<List<ChargingStationEntity>> searchChargers(String query);

  /// Fetches charging stations based on dynamic filters.
  Future<List<ChargingStationEntity>> filterChargers({
    required Map<String, dynamic> filters,
  });
}
