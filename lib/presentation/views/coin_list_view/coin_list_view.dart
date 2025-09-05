import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/blocs/coin_list/coin_list_bloc.dart';

import 'package:test_task/presentation/views/widgets/coin_item_widget.dart';
import 'package:test_task/presentation/views/widgets/loading_error_widget.dart';
import 'package:test_task/presentation/views/widgets/loading_widget.dart';

class CoinListView extends StatefulWidget {
  const CoinListView({super.key});

  @override
  State<CoinListView> createState() => _CoinListViewState();
}

class _CoinListViewState extends State<CoinListView> {
  final ScrollController _scrollController = ScrollController();
  bool _noMoreData = false;

  @override
  void initState() {
    super.initState();
    context.read<CoinListBloc>().add(LoadCoinListEvent());
    _scrollController.addListener(_handleScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoinListBloc, ICoinListState>(builder: (context, state) {
        if (state is CoinListNotLoadedState) {
          return LoadingErrorWidget();
        }
        if (state is CoinListLoadedState) {
          _noMoreData = state.noMoreData;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.items.length + 1,
              itemBuilder: (context, index) {
                if (index < state.items.length) {
                  return CoinItemWidget(
                    crypto: state.items[index],
                    index: index,
                  );
                } else {
                  return _noMoreData ? const SizedBox() : const LoadingWidget();
                }
              },
            ),
          );
        }
        return const LoadingWidget();
      }),
    );
  }

  void _handleScrollPosition() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_noMoreData) {
      _loadCoins();
    }
  }

  void _loadCoins() => context.read<CoinListBloc>().add(LoadCoinListEvent());
}
