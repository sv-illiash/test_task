import 'package:test_task/core/data_state.dart';
import 'package:test_task/domain/entities/coin_entity.dart';

abstract class ICoinRepository {
  Future<DataState<List<CoinEntity>>> getAllCoins(int pageCount, int pageSize);
}
