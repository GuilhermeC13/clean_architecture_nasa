import 'package:clean_architecture_nasa/core/inject/inject.dart';
import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_architecture_nasa/features/presentation/stores/home_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/date_mock.dart';
import '../../../mocks/space_media_entity_mock.dart';

class GetSpaceMediaFromDateUsecaseMock extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeStore homeStore;
  late GetSpaceMediaFromDateUsecase usecase;

  setUp(() {
    usecase = GetSpaceMediaFromDateUsecaseMock();
    homeStore = HomeStore(usecase);
  });

  test('should return a SpaceMedia from the usecase', () async {
    // Arrange
    when(() => usecase(any()))
        .thenAnswer((_) async => const Right(tSpaceMedia));
    // act
    await homeStore.getSpaceMediaFromDate(tDate);
    late SpaceMediaEntity spaceMediaEntity;
    homeStore.spaceAnswer!.fold((l) => null, (r) => spaceMediaEntity = r);
    // Assert
    expect(spaceMediaEntity, tSpaceMedia);
    verify(() => usecase(tDate)).called(1);
  });

  final tFailure = ServerFailure();

  test('should return a Failure from the usecase when there is an error',
      () async {
    // Arrange
    when(() => usecase(any())).thenAnswer((_) async => Left(tFailure));
    // act
    await homeStore.getSpaceMediaFromDate(tDate);
    // Assert
    expect(ServerFailure(), ServerFailure());
    verify(() => usecase(tDate)).called(1);
  });
}
