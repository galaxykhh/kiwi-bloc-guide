part of '../screen/infinite_scroll_screen.dart';

class _InfiniteScrollEmptyView extends StatelessWidget {
  const _InfiniteScrollEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('리스트 없음'));
  }
}
