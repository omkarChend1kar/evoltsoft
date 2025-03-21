part of 'createaccount_cubit.dart';

abstract class CreateAccountState extends Equatable {}

class CreateAccountLoading extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccountInitial extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccountComplete extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccountError extends CreateAccountState {
  final Failure failure;
  CreateAccountError({required this.failure});
  @override
  List<Object?> get props => [failure];
}
