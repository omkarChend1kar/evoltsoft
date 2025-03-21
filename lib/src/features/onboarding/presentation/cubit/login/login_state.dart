// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginComplete extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final Failure failure;
  LoginError({required this.failure});
  @override
  List<Object?> get props => [failure];
}
