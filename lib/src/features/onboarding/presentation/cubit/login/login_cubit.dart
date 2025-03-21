import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
