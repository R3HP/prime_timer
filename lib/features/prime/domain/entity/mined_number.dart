// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MinedNumber {
  final int number;
  final DateTime minedAt;

  MinedNumber({
    required this.number,
    required this.minedAt,
  });

  bool isPrime(){
    if (number <= 1) return false;
    if (number == 2) return true;
    if (number % 2 == 0) return false;
    for (int i = 3; i <= number ~/ i; i += 2) {
      if (number % i == 0) return false;
    }
    return true;
  }

  MinedNumber copyWith({
    int? number,
    DateTime? minedAt,
  }) {
    return MinedNumber(
      number: number ?? this.number,
      minedAt: minedAt ?? this.minedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'minedAt': minedAt.toIso8601String(),
    };
  }

  factory MinedNumber.fromMap(Map<String, dynamic> map) {
    return MinedNumber(
      number: map['number'] as int,
      minedAt: DateTime.parse(map['minedAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory MinedNumber.fromJson(String source) => MinedNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MinedNumber(number: $number, minedAt: $minedAt)';

  @override
  bool operator ==(covariant MinedNumber other) {
    if (identical(this, other)) return true;
  
    return 
      other.number == number &&
      other.minedAt == minedAt;
  }

  @override
  int get hashCode => number.hashCode ^ minedAt.hashCode;
}
