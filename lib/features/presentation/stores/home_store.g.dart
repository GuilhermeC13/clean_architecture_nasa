// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_HomeStoreBase.state'))
      .value;

  late final _$_spaceEntityFutureAtom =
      Atom(name: '_HomeStoreBase._spaceEntityFuture', context: context);

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
      Atom(name: '_HomeStoreBase.spaceAnswer', context: context);

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
      Atom(name: '_HomeStoreBase.spaceMediaEntity', context: context);

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

  late final _$dateAtom = Atom(name: '_HomeStoreBase.date', context: context);

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$getSpaceMediaFromDateAsyncAction =
      AsyncAction('_HomeStoreBase.getSpaceMediaFromDate', context: context);

  @override
  Future getSpaceMediaFromDate(DateTime date) {
    return _$getSpaceMediaFromDateAsyncAction
        .run(() => super.getSpaceMediaFromDate(date));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  dynamic setDate(DateTime dateTime) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDate');
    try {
      return super.setDate(dateTime);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
spaceAnswer: ${spaceAnswer},
spaceMediaEntity: ${spaceMediaEntity},
date: ${date},
state: ${state}
    ''';
  }
}
