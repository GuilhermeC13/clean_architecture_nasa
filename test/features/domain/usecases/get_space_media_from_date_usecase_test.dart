import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:clean_architecture_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/date_mock.dart';
import '../../../mocks/space_media_entity_mock.dart';

class MockSpaceMediaRepository extends Mock implements SpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late SpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  test('Should get space media for a given date from the repository', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
        (_) async => const Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    // Act
    final result = await usecase(tDate);
    // Assert
    expect(result, const Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('Should return a ServerFailure when dont suceed', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    // Act
    final result = await usecase(tDate);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}
