import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'chargerdetails_state.dart';

@injectable
class ChargerDetailsCubit extends Cubit<ChargerDetailsState> {
  ChargerDetailsCubit() : super(ChargerDetailsInitial());
}
