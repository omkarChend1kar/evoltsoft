// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';

import 'package:evoltsoft/src/core/utills/usecase/usecase.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/repositories/charger_discovery_repository.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/usecases/charger_discovery_usecase.dart';
import 'package:injectable/injectable.dart';

///[Marker Interface] to let user create an account with email and password
abstract class GetNearbyChargersUsecase extends ChargerDiscoveryUsecase
    implements UseCase<List<ChargingStationEntity>, Params> {}

/// this class is used for parameter method
class Params extends Equatable {
  final double latitude;
  final double longitude;
  final double? radius; // Default 5 km
  final List<ConnectorEntity>? connectorTypes;
  final bool? onlyAvailable; //

  const Params({
    required this.latitude,
    required this.longitude,
    this.connectorTypes,
    this.onlyAvailable,
    this.radius,
  });

  @override
  List<Object?> get props => [
    latitude,
    longitude,
    radius,
    connectorTypes,
    onlyAvailable,
  ];
}

@Injectable(as: GetNearbyChargersUsecase)
class GetNearbyChargersUsecaseImpl extends GetNearbyChargersUsecase {
  final ChargerDiscoveryRepository chargerDiscoveryRepository;
  GetNearbyChargersUsecaseImpl({required this.chargerDiscoveryRepository});
  @override
  Future<Either<Failure, List<ChargingStationEntity>>>? call(Params params) {
    return chargerDiscoveryRepository.getNearbyChargers(
      latitude: params.latitude,
      longitude: params.longitude,
      connectorTypes: params.connectorTypes,
      onlyAvailable: params.onlyAvailable,
      radius: params.radius ?? 5000,
    );
  }
}
