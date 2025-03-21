import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';

class ConnectorModel extends ConnectorEntity {
  const ConnectorModel({
    required super.type,
    required super.powerCapacity,
    required super.totalPlugs,
    required super.availablePlugs,
  });

  factory ConnectorModel.fromJson(Map<String, dynamic> json) {
    return ConnectorModel(
      type: json['type'],
      powerCapacity: (json['powerCapacity']).toDouble(),
      totalPlugs: json['totalPlugs'],
      availablePlugs: json['availablePlugs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'powerCapacity': powerCapacity,
      'totalPlugs': totalPlugs,
      'availablePlugs': availablePlugs,
    };
  }

  factory ConnectorModel.fromEntity(ConnectorEntity entity) {
    return ConnectorModel(
      type: entity.type,
      powerCapacity: entity.powerCapacity,
      totalPlugs: entity.totalPlugs,
      availablePlugs: entity.availablePlugs,
    );
  }

  static List<ConnectorModel> fromEntityList(List<ConnectorEntity> entities) {
    return entities.map((entity) => ConnectorModel.fromEntity(entity)).toList();
  }
}
