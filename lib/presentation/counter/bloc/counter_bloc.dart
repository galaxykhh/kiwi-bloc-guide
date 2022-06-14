import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

typedef CounterEmitter = Emitter<CounterState>;

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onIncrementPressed(_, CounterEmitter emit) => emit(state.copyWith(count: state.count + 1));
  void _onDecrementPressed(_, CounterEmitter emit) => emit(state.copyWith(count: state.count - 1));
}
