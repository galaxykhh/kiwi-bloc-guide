part of 'infinite_scroll_bloc.dart';

abstract class InfiniteScrollEvent extends Equatable {
  const InfiniteScrollEvent();

  @override
  List<Object> get props => [];
}

class InfiniteScrollStarted extends InfiniteScrollEvent {}

class InfiniteScrollGetMoreRequested extends InfiniteScrollEvent {}
