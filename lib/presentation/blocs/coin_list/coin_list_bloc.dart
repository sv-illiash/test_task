import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/core/data_state.dart';
import 'package:test_task/core/params/get_coin_list_params.dart';
import 'package:test_task/domain/entities/coin_entity.dart';
import 'package:test_task/domain/usecases/get_all_coins_usecase.dart';

part 'coin_list_event.dart';
part 'coin_list_state.dart';

class CoinListBloc extends Bloc<ICoinListEvent, ICoinListState> {
  final FetchAllCoinsUseCase _fetchAllCoinsUseCase;
  static const int pageSize = 15;
  final List<CoinEntity> list = [];
  int pageCount = 1;
  bool noMoreData = false;

  CoinListBloc(this._fetchAllCoinsUseCase) : super(CoinListInitial()) {
    on<LoadCoinListEvent>((event, emit) async {
      final dataState = await _fetchAllCoinsUseCase(
          params: GetCoinListParams(pageCount: pageCount, pageSize: pageSize));
      if (dataState is DataSuccess<List<CoinEntity>>) {
        final newList = dataState.data;
        noMoreData = newList.length < pageSize;
        list.addAll(newList);
        pageCount++;
        if (list.isNotEmpty) {
          emit(CoinListLoadedState(List.from(list), noMoreData));
        }
      }

      if (dataState is DataFailed<String>) {
        emit(CoinListNotLoadedState());
      }
    });
  }
}



