import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  DateTime date = DateTime.now();

  @action
  setDate(DateTime newDate) {
    date = newDate;
  }
}
