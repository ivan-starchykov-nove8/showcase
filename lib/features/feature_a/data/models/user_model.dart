import 'package:equatable/equatable.dart';

/// Represents a user model with a [name].
final class UserModel extends Equatable {
  const UserModel({required this.name});

  final String name;

  /// Creates a [UserModel] from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
    );
  }

  /// Converts the [UserModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }

  @override
  List<Object?> get props => [name];
}
