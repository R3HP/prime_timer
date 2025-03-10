import 'package:prime_timer/features/prime/domain/usecase/get_prime_number_with_elapsed_time_usecase.dart';
import 'package:prime_timer/features/prime/presentation/view_model/prime_timer_view_model.dart';

class PrimeTimerController {
  final GetPrimeNumberWithElapsedTimeUsecase _getPrimeNumberWithElapsedTimeUsecase;

  PrimeTimerController({
    required GetPrimeNumberWithElapsedTimeUsecase getPrimeNumberWithElapsedTimeUsecase,
  }) : _getPrimeNumberWithElapsedTimeUsecase = getPrimeNumberWithElapsedTimeUsecase;

  Stream<PrimeTimerViewModel> getPrimeNumberStream() {
    return _getPrimeNumberWithElapsedTimeUsecase.call().map((data) {
      return PrimeTimerViewModel(
        primeNumber: data.prime,
        elapsedSeconds: data.elapsedTime,
        error: data.error,
      );
    });
  }
}
