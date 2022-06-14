part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({
    required this.count,
  });

  final int count;

  static CounterState get initial => const CounterState(
        count: 0,
      );

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [count];
}
