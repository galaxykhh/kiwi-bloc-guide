part of '../screen/infinite_scroll_screen.dart';

class _InfiniteScrollLoadingView extends StatelessWidget {
  const _InfiniteScrollLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(30, (index) => index).map((_) => const NumberListItem.skeleton()).toList(),
    );
  }
}
