import 'package:prime_timer/features/prime/domain/entity/mined_number.dart';
import 'package:prime_timer/features/prime/domain/repository/mined_number_repository.dart';

class GetPrimeNumberWithElapsedTimeUsecase {
  final MinedNumberRepository minedNumberRepository;

  GetPrimeNumberWithElapsedTimeUsecase({required this.minedNumberRepository});
        MinedNumber? lastMinedNumber;

  Stream<({int prime, int elapsedTime, String? error})> call() async* {
    await for (var minedNumber
        in minedNumberRepository.getMinedNumberStream()) {
      if (minedNumber.isPrime()) {
        int elapsedTime = 0;
        String? error;
        // Try to get last mined number, but continue if it fails
        try {
          lastMinedNumber = await minedNumberRepository.getLastMinedNumber();
        } catch (e) {
          error = "Warning: Unable to retrieve last mined number.";
        }
        elapsedTime =
            minedNumber.minedAt
                .difference(lastMinedNumber?.minedAt ?? DateTime.now())
                .inSeconds
                .abs();

        // Try to save, but continue if it fails
        try {
          await minedNumberRepository.saveMinedNumber(minedNumber);
        } catch (e) {
          error = "Warning: Progress not saved.";
        }

        lastMinedNumber = minedNumber;

        // Emit prime number with elapsed time + potential error message
        yield (
          prime: minedNumber.number,
          elapsedTime: elapsedTime,
          error: error,
        );
      }
    }
  }
}
