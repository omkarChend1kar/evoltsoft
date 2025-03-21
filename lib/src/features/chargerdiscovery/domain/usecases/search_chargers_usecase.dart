// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/usecase/usecase.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/repositories/charger_discovery_repository.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/domain/usecases/charger_discovery_usecase.dart';
import 'package:injectable/injectable.dart';

///[Marker Interface] to let user create an account with email and password
abstract class SearchChargersUsecase extends ChargerDiscoveryUsecase
    implements UseCase<List<ChargingStationEntity>, Params> {}

/// this class is used for parameter method
class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  List<Object?> get props => [query];
}

@Injectable(as: SearchChargersUsecase)
class SearchChargersUsecaseImpl extends SearchChargersUsecase {
  final ChargerDiscoveryRepository chargerDiscoveryRepository;
  SearchChargersUsecaseImpl({required this.chargerDiscoveryRepository});
  @override
  Future<Either<Failure, List<ChargingStationEntity>>>? call(Params params) {
    return chargerDiscoveryRepository.searchChargers(params.query);
  }
}
