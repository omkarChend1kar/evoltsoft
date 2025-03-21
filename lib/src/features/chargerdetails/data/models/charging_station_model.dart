

import 'package:evoltsoft/src/features/chargerdetails/data/models/connector_model.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';

class ChargingStationModel extends ChargingStationEntity {
  ChargingStationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.latitude,
    required super.longitude,
    required List<ConnectorModel> super.connectors,
    required super.openHours,
    required super.imageUrl,
  });

  // Factory method to create from JSON (e.g., API response)
  factory ChargingStationModel.fromJson(Map<String, dynamic> json) {
    return ChargingStationModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      connectors: (json['connectors'] as List)
          .map((c) => ConnectorModel.fromJson(c))
          .toList(),
      openHours: json['openHours'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert model to JSON for API calls or local storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'connectors': connectors.map((c) => (c as ConnectorModel).toJson()).toList(),
      'openHours': openHours,
      'imageUrl': imageUrl,
    };
  }
}
