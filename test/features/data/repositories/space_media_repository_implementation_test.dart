import 'package:clean_architecture_nasa/core/usecase/errors/exceptions.dart';
import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:clean_architecture_nasa/features/data/models/space_media_model.dart';
import 'package:clean_architecture_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDatasource extends Mock implements SpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repositoryImplementation;
  late SpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repositoryImplementation = SpaceMediaRepositoryImplementation(datasource);
  });

  const tSpaceMediaModel = SpaceMediaModel(
    explanation: 'Teste descricao',
    media_type: 'image',
    title: 'lala',
    url: 'url teste',
  );

  final tDate = DateTime(2022, 02, 02);

  test("should return space media model when calls the datasource", () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    // act
    final result = await repositoryImplementation.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, const Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate));
  });

  test('Should return a ServerFailure when the call to datasource dont succeed',
      () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());
    // Act
    final result = await repositoryImplementation.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate));
  });
}
