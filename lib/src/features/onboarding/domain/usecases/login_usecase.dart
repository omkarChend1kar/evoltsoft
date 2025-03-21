import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/usecase/usecase.dart';
import 'package:evoltsoft/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:evoltsoft/src/features/onboarding/domain/usecases/onboarding_usecase.dart';
import 'package:injectable/injectable.dart';

/// [Marker Interface] to let user login with email and password
abstract class LoginUsecase extends OnboardingUsecase
    implements UseCase<void, Params> {}

/// this class is used for parameter method
class Params extends Equatable {
  final String email;
  final String password;

  const Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

@Singleton(as: LoginUsecase)
class LoginUsecaseImpl extends LoginUsecase {
  final OnboardingRepository onboardingRepository;
  LoginUsecaseImpl({required this.onboardingRepository});
  @override
  Future<Either<Failure, void>>? call(Params params) {
    return onboardingRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}