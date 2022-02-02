import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/data/datasources/currencies_remote_datasource.dart';
import '../../../core/data/repositories/currencies_repository.dart';
import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CurrenciesRemoteDatasourceImpl(i.get<Dio>())),
    Bind((i) => CurrenciesImpl(i.get())),
    Bind.lazySingleton((i) => HomeStore(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
