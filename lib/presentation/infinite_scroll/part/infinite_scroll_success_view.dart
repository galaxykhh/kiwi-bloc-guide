part of '../screen/infinite_scroll_screen.dart';

class _InfiniteScrollSuccessView extends StatelessWidget {
  const _InfiniteScrollSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InfiniteScrollBloc, InfiniteScrollState, List<int>>(
      selector: (state) => state.numbers,
      builder: (context, numbers) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) => _onNotification(notification, context),
          child: ListView.builder(
            itemCount: numbers.length + 1,
            itemBuilder: (context, index) {
              if (index == numbers.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final number = numbers[index];
              return NumberListItem(number: number);
            },
          ),
        );
      },
    );
  }

  bool _onNotification(ScrollNotification notification, BuildContext context) {
    final double currentOffset = notification.metrics.pixels;
    final double targetOffset = notification.metrics.maxScrollExtent;
    final bool shouldFetchMore = currentOffset >= targetOffset * 0.99;

    if (shouldFetchMore) {
      context.read<InfiniteScrollBloc>().add(InfiniteScrollGetMoreRequested());
    }

    return false;
  }
}
