import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';

class ChargingStationDTO {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<ConnectorEntity> connectors;
  final String openHours;
  final String imageUrl;
  final double totalPowerCapacity;
  final double availablePowerCapacity;
  final bool isAvailable;

  ChargingStationDTO({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.connectors,
    required this.openHours,
    required this.imageUrl,
    required this.totalPowerCapacity,
    required this.availablePowerCapacity,
    required this.isAvailable,
  });

  factory ChargingStationDTO.fromEntity(ChargingStationEntity entity) {
    double totalPower = entity.connectors.fold(
      0,
      (sum, connector) =>
          sum + (connector.powerCapacity * connector.totalPlugs),
    );
    double availablePower = entity.connectors.fold(
      0,
      (sum, connector) =>
          sum + (connector.powerCapacity * connector.availablePlugs),
    );
    bool available = entity.connectors.any(
      (connector) => connector.isAvailable,
    );

    return ChargingStationDTO(
      id: entity.id,
      name: entity.name,
      address: entity.address,
      latitude: entity.latitude,
      longitude: entity.longitude,
      connectors: entity.connectors,
      openHours: entity.openHours,
      imageUrl: entity.imageUrl,
      totalPowerCapacity: totalPower,
      availablePowerCapacity: availablePower,
      isAvailable: available,
    );
  }
}
