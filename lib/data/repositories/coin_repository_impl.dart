import 'package:test_task/core/data_state.dart';
import 'package:test_task/data/datasource/remote/app_api_service.dart';
import 'package:test_task/data/extension/api_extension.dart';
import 'package:test_task/data/mappers/coin_list_mapper.dart';
import 'package:test_task/domain/entities/coin_entity.dart';
import 'package:test_task/domain/repositories/coin_repo.dart';

class CoinRepositoryImpl extends ICoinRepository {

  final AppApiService _appApiService;

  CoinRepositoryImpl(this._appApiService);

  @override
  Future<DataState<List<CoinEntity>>> getAllCoins(int pageCount, int pageSize) async {
    return await doSafeApiCall(() async => await _appApiService.fetchAllCoins(pageCount * pageSize , pageSize),
            (response) => CoinListMapper.listFromApi(response));
  }
}