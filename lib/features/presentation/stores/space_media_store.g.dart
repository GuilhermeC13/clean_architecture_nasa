// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_media_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpaceMediaStore on _SpaceMediaStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_SpaceMediaStoreBase.state'))
          .value;

  late final _$_spaceEntityFutureAtom =
      Atom(name: '_SpaceMediaStoreBase._spaceEntityFuture', context: context);

  @override
  ObservableFuture<Either<Failure, SpaceMediaEntity>>? get _spaceEntityFuture {
    _$_spaceEntityFutureAtom.reportRead();
    return super._spaceEntityFuture;
  }

  @override
  set _spaceEntityFuture(
      ObservableFuture<Either<Failure, SpaceMediaEntity>>? value) {
    _$_spaceEntityFutureAtom.reportWrite(value, super._spaceEntityFuture, () {
      super._spaceEntityFuture = value;
    });
  }

  late final _$spaceAnswerAtom =
      Atom(name: '_SpaceMediaStoreBase.spaceAnswer', context: context);

  @override
  Either<Failure, SpaceMediaEntity>? get spaceAnswer {
    _$spaceAnswerAtom.reportRead();
    return super.spaceAnswer;
  }

  @override
  set spaceAnswer(Either<Failure, SpaceMediaEntity>? value) {
    _$spaceAnswerAtom.reportWrite(value, super.spaceAnswer, () {
      super.spaceAnswer = value;
    });
  }

  late final _$spaceMediaEntityAtom =
      Atom(name: '_SpaceMediaStoreBase.spaceMediaEntity', context: context);

  @override
  SpaceMediaEntity? get spaceMediaEntity {
    _$spaceMediaEntityAtom.reportRead();
    return super.spaceMediaEntity;
  }

  @override
  set spaceMediaEntity(SpaceMediaEntity? value) {
    _$spaceMediaEntityAtom.reportWrite(value, super.spaceMediaEntity, () {
      super.spaceMediaEntity = value;
    });
  }

  late final _$getSpaceMediaFromDateAsyncAction = AsyncAction(
      '_SpaceMediaStoreBase.getSpaceMediaFromDate',
      context: context);

  @override
  Future getSpaceMediaFromDate(DateTime date) {
    return _$getSpaceMediaFromDateAsyncAction
        .run(() => super.getSpaceMediaFromDate(date));
  }

  @override
  String toString() {
    return '''
spaceAnswer: ${spaceAnswer},
spaceMediaEntity: ${spaceMediaEntity},
state: ${state}
    ''';
  }
}
