import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final bool isEmailVerified;
  final String? phoneNumber;
  final bool isPhoneVerified;
  final String authMethod; // e.g., "email", "google", "apple"

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isEmailVerified,
    this.phoneNumber,
    required this.isPhoneVerified,
    required this.authMethod,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    isEmailVerified,
    phoneNumber,
    isPhoneVerified,
    authMethod,
  ];
}
