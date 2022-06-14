part of 'infinite_scroll_bloc.dart';

enum InfiniteScrollStatus {
  initial,
  loading,
  success,
  failure,
}

class InfiniteScrollState extends Equatable {
  const InfiniteScrollState({
    required this.status,
    required this.numbers,
  });

  final InfiniteScrollStatus status;
  final List<int> numbers;

  static InfiniteScrollState get initial => const InfiniteScrollState(
        status: InfiniteScrollStatus.initial,
        numbers: [],
      );

  InfiniteScrollState copyWith({
    InfiniteScrollStatus? status,
    List<int>? numbers,
  }) {
    return InfiniteScrollState(
      status: status ?? this.status,
      numbers: numbers ?? this.numbers,
    );
  }

  @override
  List<Object> get props => [numbers, status];
}
