import 'package:showcase/core/mapper/mapper.dart';
import 'package:showcase/features/feature_a/data/models/user_model.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';

final class _UserModelToEntityMapper implements Mapper<UserModel, UserEntity> {
  @override
  UserModel fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
    );
  }

  @override
  UserEntity toEntity(UserModel model) {
    return UserEntity(
      name: model.name,
    );
  }
}

extension UserModelExt on UserModel {
  UserEntity get asEntity => _UserModelToEntityMapper().toEntity(this);
}

extension UserEntityExt on UserEntity {
  UserModel get asModel => _UserModelToEntityMapper().fromEntity(this);
}
