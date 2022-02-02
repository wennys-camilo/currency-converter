// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$loadingAtom = Atom(name: 'HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$currenciesAtom = Atom(name: 'HomeStoreBase.currencies');

  @override
  Currencies? get currencies {
    _$currenciesAtom.reportRead();
    return super.currencies;
  }

  @override
  set currencies(Currencies? value) {
    _$currenciesAtom.reportWrite(value, super.currencies, () {
      super.currencies = value;
    });
  }

  final _$failureAtom = Atom(name: 'HomeStoreBase.failure');

  @override
  Option<Failure>? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<Failure>? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$realAtom = Atom(name: 'HomeStoreBase.real');

  @override
  double? get real {
    _$realAtom.reportRead();
    return super.real;
  }

  @override
  set real(double? value) {
    _$realAtom.reportWrite(value, super.real, () {
      super.real = value;
    });
  }

  final _$dolarAtom = Atom(name: 'HomeStoreBase.dolar');

  @override
  double? get dolar {
    _$dolarAtom.reportRead();
    return super.dolar;
  }

  @override
  set dolar(double? value) {
    _$dolarAtom.reportWrite(value, super.dolar, () {
      super.dolar = value;
    });
  }

  final _$euroAtom = Atom(name: 'HomeStoreBase.euro');

  @override
  double? get euro {
    _$euroAtom.reportRead();
    return super.euro;
  }

  @override
  set euro(double? value) {
    _$euroAtom.reportWrite(value, super.euro, () {
      super.euro = value;
    });
  }

  final _$fetchCurrenciesAsyncAction =
      AsyncAction('HomeStoreBase.fetchCurrencies');

  @override
  Future<void> fetchCurrencies() {
    return _$fetchCurrenciesAsyncAction.run(() => super.fetchCurrencies());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic onChangeCurrencieBrl(double value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.onChangeCurrencieBrl');
    try {
      return super.onChangeCurrencieBrl(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeCurrencieDolar(double value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.onChangeCurrencieDolar');
    try {
      return super.onChangeCurrencieDolar(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeCurrencieEuro(double value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.onChangeCurrencieEuro');
    try {
      return super.onChangeCurrencieEuro(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
currencies: ${currencies},
failure: ${failure},
real: ${real},
dolar: ${dolar},
euro: ${euro}
    ''';
  }
}
