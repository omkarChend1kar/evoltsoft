import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chargerdiscovery_state.dart';

class ChargerDiscoveryCubit extends Cubit<ChargerDiscoveryState> {
  ChargerDiscoveryCubit() : super(ChargerDiscoveryInitial());
}
