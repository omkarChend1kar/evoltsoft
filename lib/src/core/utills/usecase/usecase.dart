import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// This general use case structure for calling the usecase method
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params);
}

/// this class is used for no parameter method
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
