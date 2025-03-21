import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';

abstract class ChargerDetailsRepository {
  /// Fetches details of a specific charging station by ID.
  Future<ChargingStationEntity> getChargerDetails(String stationId);

  /// Fetches real-time availability of plugs at the station.
  Future<Map<String, bool>> getRealTimeAvailability(String stationId);

  /// Fetches pricing details for charging at the station.
  Future<double> getChargingPrice(String stationId);

  /// Fetches operational status (Open/Closed) based on current time.
  Future<bool> isStationOperational(String stationId);
}
