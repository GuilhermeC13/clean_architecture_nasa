import 'package:clean_architecture_nasa/core/usecase/errors/failures.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'space_media_store.g.dart';

class SpaceMediaStore = _SpaceMediaStoreBase with _$SpaceMediaStore;

enum StoreState { initial, loading, loaded }

abstract class _SpaceMediaStoreBase with Store {
  final GetSpaceMediaFromDateUsecase usecase;

  _SpaceMediaStoreBase(this.usecase);

  @observable
  ObservableFuture<Either<Failure, SpaceMediaEntity>>? _spaceEntityFuture;

  @observable
  Either<Failure, SpaceMediaEntity>? spaceAnswer;

  @observable
  SpaceMediaEntity? spaceMediaEntity;

  @computed
  StoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_spaceEntityFuture == null ||
        _spaceEntityFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _spaceEntityFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  getSpaceMediaFromDate(DateTime date) async {
    _spaceEntityFuture = ObservableFuture(usecase(date));

    spaceAnswer = await _spaceEntityFuture;

    spaceAnswer!.fold(
        (error) => ServerFailure(), (success) => spaceMediaEntity = success);
  }
}
