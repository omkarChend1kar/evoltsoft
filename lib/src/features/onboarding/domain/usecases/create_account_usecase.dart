import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evoltsoft/src/core/utills/error/failures.dart';
import 'package:evoltsoft/src/core/utills/usecase/usecase.dart';
import 'package:evoltsoft/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:evoltsoft/src/features/onboarding/domain/usecases/onboarding_usecase.dart';
import 'package:injectable/injectable.dart';

///[Marker Interface] to let user create an account with email and password
abstract class CreateAccountUsecase extends OnboardingUsecase
    implements UseCase<void, Params> {}

/// this class is used for parameter method
class Params extends Equatable {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  const Params({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [email, password];
}

@Singleton(as: CreateAccountUsecase)
class CreateAccountUsecaseImpl extends CreateAccountUsecase {
  final OnboardingRepository onboardingRepository;
  CreateAccountUsecaseImpl({required this.onboardingRepository});
  @override
  Future<Either<Failure, void>>? call(Params params) {
    return onboardingRepository.createAccount(
      email: params.email,
      password: params.password,
    );
  }
}
