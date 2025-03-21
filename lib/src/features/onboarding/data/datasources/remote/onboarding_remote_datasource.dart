import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/features/onboarding/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class OnboardingRemoteDataSource {
  ///
  Future<void> createAccount({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  });

  ///
  Future<void> login({required String email, required String password});

  ///
}

@Singleton(as: OnboardingRemoteDataSource)
class OnboardingRemoteDatasourceImpl extends OnboardingRemoteDataSource {
  final FirebaseAuth auth;

  OnboardingRemoteDatasourceImpl({required this.auth});
  @override
  Future<void> createAccount({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw ServerException(
        errorMessage: e.message ?? "Firebase error",
        errorCode: e.code,
      );
    } catch (e) {
      if (e.runtimeType == ServerException) {
        throw ServerException(
          errorMessage: (e as ServerException).errorMessage,
          errorCode: (e).errorCode,
        );
      } else {
        throw ServerException(errorMessage: "Unexpected error: $e");
      }
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw ServerException(
        errorMessage: e.message ?? "Firebase error",
        errorCode: e.code,
      );
    } catch (e) {
      if (e.runtimeType == ServerException) {
        throw ServerException(
          errorMessage: (e as ServerException).errorMessage,
          errorCode: (e).errorCode,
        );
      } else {
        throw ServerException(errorMessage: "Unexpected error: $e");
      }
    }
  }
}
