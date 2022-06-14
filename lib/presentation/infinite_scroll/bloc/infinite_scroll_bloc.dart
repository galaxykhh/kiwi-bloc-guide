import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/data/number/repository/number_repository.dart';

part 'infinite_scroll_event.dart';
part 'infinite_scroll_state.dart';

typedef InfiniteScrollEmitter = Emitter<InfiniteScrollState>;

class InfiniteScrollBloc extends Bloc<InfiniteScrollEvent, InfiniteScrollState> {
  InfiniteScrollBloc({
    required NumberRepository numberRepository,
  })  : _numberRepository = numberRepository,
        super(InfiniteScrollState.initial) {
    on<InfiniteScrollStarted>(_onStarted);
    on<InfiniteScrollGetMoreRequested>(_onFetchMoreRequested, transformer: droppable());
  }

  final NumberRepository _numberRepository;

  Future<void> _onStarted(_, InfiniteScrollEmitter emit) async {
    emit(state.copyWith(status: InfiniteScrollStatus.loading));

    await emit.forEach<List<int>>(
      _numberRepository.getNumbers(),
      onData: (numbers) => state.copyWith(
        numbers: numbers,
        status: InfiniteScrollStatus.success,
      ),
      onError: (_, __) => state.copyWith(status: InfiniteScrollStatus.failure),
    );
  }

  Future<void> _onFetchMoreRequested(_, InfiniteScrollEmitter emit) async => _numberRepository.getMoreNumbers();

  @override
  Future<void> close() {
    _numberRepository.dispose();
    return super.close();
  }
}
