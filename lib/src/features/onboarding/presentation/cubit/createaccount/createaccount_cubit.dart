// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';

import 'package:evoltsoft/src/features/onboarding/domain/usecases/create_account_usecase.dart';
import 'package:injectable/injectable.dart';

part 'createaccount_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  final CreateAccountUsecase createAccountUsecase;
  CreateAccountCubit(this.createAccountUsecase) : super(CreateAccountInitial());

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    emit(CreateAccountLoading());
    final result = await createAccountUsecase(
      Params(email: email, password: password),
    );
    result?.fold(
      (l) {
        emit(CreateAccountError(failure: l));
      },
      (r) {
        emit(CreateAccountComplete());
      },
    );
  }
}
