import 'package:dartz/dartz.dart';
import '../../helpers/failure.dart';
import '../datasources/currencies_remote_datasource.dart';
import '../models/currencies.dart';

abstract class CurrenciesRepository {
  Future<Either<Failure, Currencies>> fetch();
}

class CurrenciesImpl implements CurrenciesRepository {
  final CurrenciesRemoteDatasource _remoteDatasource;

  const CurrenciesImpl(
    this._remoteDatasource,
  );

  @override
  Future<Either<Failure, Currencies>> fetch() async {
    try {
      final response = await _remoteDatasource.fetch();
      return Right(response!);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
