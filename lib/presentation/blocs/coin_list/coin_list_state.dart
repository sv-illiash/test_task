part of 'coin_list_bloc.dart';

sealed class ICoinListState extends Equatable {
  const ICoinListState();

  @override
  List<Object> get props => [];
}

final class CoinListInitial extends ICoinListState {
}

class CoinListLoadedState extends ICoinListState {
  final List<CoinEntity> items;
  final bool noMoreData;

  const CoinListLoadedState(this.items,this.noMoreData);

  @override
  List<Object> get props => [items];
}

class CoinListNotLoadedState extends ICoinListState {}