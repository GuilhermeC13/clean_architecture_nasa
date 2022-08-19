import 'package:clean_architecture_nasa/core/usecase/errors/exceptions.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class SpaceMediaRepositoryImplementation implements SpaceMediaRepository {
  final SpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);
  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
