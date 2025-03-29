import 'package:equatable/equatable.dart';

/// Represents a user entity with a [name].
final class UserEntity extends Equatable {
  const UserEntity({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}
