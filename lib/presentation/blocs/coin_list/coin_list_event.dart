part of 'coin_list_bloc.dart';

abstract class ICoinListEvent extends Equatable {

  const ICoinListEvent();

  List<Object?> get props => [];
}

class LoadCoinListEvent extends ICoinListEvent {
}

