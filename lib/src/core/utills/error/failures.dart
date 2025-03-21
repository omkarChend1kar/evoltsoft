import 'package:equatable/equatable.dart';

/// Failure abstract class for List of properties Failure
abstract class Failure extends Equatable {
  final String? message;
  final String? code;

  const Failure({required this.code, required this.message});

  @override
  List<Object?> get props => [message];
}

/// General Failure
/// this class is used to show Server Failure
class ServerFailure extends Failure {
  const ServerFailure({String? message, String? code})
      : super(code: code ?? '', message: message ?? '');
}

/// this class is used to show cache Failure
class CacheFailure extends Failure {
  const CacheFailure({String? message, String? code})
      : super(code: code ?? '', message: message ?? '');
}

/// General Failure
/// this class is used to show network Failure
class NetworkFailure extends Failure {
  const NetworkFailure({String? message, String? code})
      : super(code: code ?? '', message: message ?? '');
}
