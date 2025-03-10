class PrimeTimerViewModel {
  final int primeNumber;
  final int elapsedSeconds;
  String? error;

  PrimeTimerViewModel({
    required this.primeNumber,
    required this.elapsedSeconds,
    this.error,
  });
}
