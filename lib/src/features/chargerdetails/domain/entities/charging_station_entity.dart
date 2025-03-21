import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';

class ChargingStationEntity {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<ConnectorEntity> connectors; // Multiple plug types
  final String openHours;
  final String imageUrl;

  ChargingStationEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.connectors,
    required this.openHours,
    required this.imageUrl,
  });
}
