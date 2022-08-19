import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date);
}
