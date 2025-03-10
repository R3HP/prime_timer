import 'dart:async';

import 'package:prime_timer/features/prime/data/data_source/mined_number_datasource.dart';
import 'package:prime_timer/features/prime/data/data_source/number_data_source.dart';
import 'package:prime_timer/features/prime/domain/entity/mined_number.dart';
import 'package:prime_timer/features/prime/domain/repository/mined_number_repository.dart';

class MinedNumberRepositoryImpl implements MinedNumberRepository {
  final NumberDataSource numberDataSource;
  final MinedNumberDatasource minedNumberDatasource;

  MinedNumberRepositoryImpl({
    required this.numberDataSource,
    required this.minedNumberDatasource,
  });

  @override
  Future<MinedNumber?> getLastMinedNumber() {
    return minedNumberDatasource.getLastMinedNumber();
  }

  @override
  Stream<MinedNumber> getMinedNumberStream({int epochSeconds = 10}) {
     return Stream.periodic(Duration(seconds: epochSeconds), (_) => 0).asyncMap((
      _,
    ) async {
      try {
        final number = await numberDataSource.getNumber();
        return MinedNumber(number: number, minedAt: DateTime.now());
      } catch (e) {
        return Future.error(e);
      }
    });
  }

  @override
  Future<void> saveMinedNumber(MinedNumber minedNumber) {
    return minedNumberDatasource.saveMinedNumber(minedNumber);
  }
}
