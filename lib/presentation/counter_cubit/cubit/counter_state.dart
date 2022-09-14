part of 'counter_cubit.dart';

class CounterState extends Equatable {
  const CounterState(this.count);

  final int count;

  CounterState copyWith(int? count) {
    return CounterState(count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}
