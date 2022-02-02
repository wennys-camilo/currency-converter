import '../../../core/data/models/currencies.dart';
import '../../../core/data/repositories/currencies_repository.dart';
import '../../../core/helpers/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CurrenciesRepository repository;

  HomeStoreBase({required this.repository});

  @observable
  bool loading = false;

  @observable
  Currencies? currencies;

  @observable
  Option<Failure>? failure;

  @observable
  double? real;

  @observable
  double? dolar;

  @observable
  double? euro;

  @action
  onChangeCurrencieBrl(double value) => real = value;

  @action
  onChangeCurrencieDolar(double value) => dolar = value;

  @action
  onChangeCurrencieEuro(double value) => euro = value;

  void convert({required typeCurrencie}) {
    if (typeCurrencie == 'Real') {
      dolar = real! / currencies!.dolar;
      euro = real! / currencies!.euro;
    } else if (typeCurrencie == 'Dolar') {
      real = dolar! * currencies!.dolar;
      euro = (dolar! * currencies!.dolar / currencies!.euro);
    } else {
      real = euro! * currencies!.euro;
      dolar = (euro! * currencies!.euro / currencies!.dolar);
    }
  }

  @action
  Future<void> fetchCurrencies() async {
    loading = true;
    failure = none();
    final response = await repository.fetch();
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (sucessResult) {
      currencies = sucessResult;
      loading = false;
    });
  }
}
