import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_bloc_bible/data/number/repository/number_repository.dart';
import 'package:kiwi_bloc_bible/presentation/infinite_scroll/bloc/infinite_scroll_bloc.dart';
import 'package:kiwi_bloc_bible/presentation/infinite_scroll/widget/number_list_item.dart';

part '../part/infinite_scroll_error_view.dart';
part '../part/infinite_scroll_loading_view.dart';
part '../part/infinite_scroll_empty_view.dart';
part '../part/infinite_scroll_success_view.dart';

class InfiniteScrollScreen extends StatelessWidget {
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  static const String routeName = 'infiniteScroll';
  static Route route() => MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => InfiniteScrollBloc(numberRepository: NumberRepository())..add(InfiniteScrollStarted()),
          child: const InfiniteScrollScreen(),
        );
      });

  @override
  Widget build(BuildContext context) {
    print('InfiniteScrollScreen Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 스크롤'),
      ),
      body: SafeArea(
        child: BlocSelector<InfiniteScrollBloc, InfiniteScrollState, InfiniteScrollStatus>(
          selector: (state) => state.status,
          builder: (context, status) {
            switch (status) {
              case InfiniteScrollStatus.initial:
              case InfiniteScrollStatus.loading:
                return const _InfiniteScrollLoadingView();

              case InfiniteScrollStatus.failure:
                return const _InfiniteScrollErrorView();

              case InfiniteScrollStatus.success:
                return const _InfiniteScrollSuccessView();
            }
          },
        ),
      ),
    );
  }
}
