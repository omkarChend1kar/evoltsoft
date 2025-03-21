import 'package:equatable/equatable.dart';

class ConnectorEntity extends Equatable {
  final String type; // e.g., "CCS", "CHAdeMO", "Type2"
  final double powerCapacity; // kW
  final int totalPlugs;
  final int availablePlugs;

  const ConnectorEntity({
    required this.type,
    required this.powerCapacity,
    required this.totalPlugs,
    required this.availablePlugs,
  });

  /// Checks availability of plugs for this connector type
  bool get isAvailable => availablePlugs > 0;

  @override
  List<Object?> get props => [type, powerCapacity, totalPlugs, availablePlugs];
}
