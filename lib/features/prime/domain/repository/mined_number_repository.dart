import 'package:prime_timer/features/prime/domain/entity/mined_number.dart';

abstract class MinedNumberRepository {
  Stream<MinedNumber> getMinedNumberStream({int epochSeconds = 10});
  Future<void> saveMinedNumber(MinedNumber minedNumber);
  Future<MinedNumber?> getLastMinedNumber();
}