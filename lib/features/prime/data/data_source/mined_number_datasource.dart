import 'package:prime_timer/core/services/database/database.dart';
import 'package:prime_timer/features/prime/domain/entity/mined_number.dart';

abstract class MinedNumberDatasource {
  Future<void> saveMinedNumber(MinedNumber minedNumber);
  Future<MinedNumber?> getLastMinedNumber();
}

class LocalMinedNumberDatasource implements MinedNumberDatasource {
  final DataBase dataBase;

  LocalMinedNumberDatasource({required this.dataBase});

  @override
  Future<MinedNumber?> getLastMinedNumber() async {
    final response = await dataBase.get<Map<String,dynamic>>('lastMinedNumber');
    if (response == null) {
      return null;
    }
    return MinedNumber.fromMap(response);
  }

  @override
  Future<void> saveMinedNumber(MinedNumber minedNumber) {
    return dataBase.set('lastMinedNumber', minedNumber.toMap());
  }
}
