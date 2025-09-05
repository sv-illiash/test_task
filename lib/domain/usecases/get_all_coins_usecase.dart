import 'package:test_task/core/data_state.dart';
import 'package:test_task/core/params/get_coin_list_params.dart';
import 'package:test_task/domain/entities/coin_entity.dart';
import 'package:test_task/domain/repositories/coin_repo.dart';
import 'package:test_task/domain/usecases/usecase.dart';

class FetchAllCoinsUseCase
    implements UseCase<DataState<List<CoinEntity>>, GetCoinListParams> {
  final ICoinRepository _coinRepository;

  FetchAllCoinsUseCase(this._coinRepository);

  @override
  Future<DataState<List<CoinEntity>>> call({required GetCoinListParams params}) async {
    return await _coinRepository.getAllCoins(params.pageCount, params.pageSize);
  }
}
