
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/data/datasource/remote/app_api_service.dart';
import 'package:test_task/data/datasource/remote/http_client.dart';
import 'package:test_task/data/repositories/coin_repository_impl.dart';
import 'package:test_task/domain/repositories/coin_repo.dart';
import 'package:test_task/domain/usecases/get_all_coins_usecase.dart';
import 'package:test_task/presentation/blocs/coin_list/coin_list_bloc.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  /// Dio client
  injector.registerLazySingleton<Dio>(() => BaseHttpClient.createDioHttpClient());
  injector.registerSingleton(AppApiService(injector()));

  /// Repositories
  injector.registerSingleton<ICoinRepository>(CoinRepositoryImpl(injector()));

  /// UseCases
  injector.registerSingleton<FetchAllCoinsUseCase>(FetchAllCoinsUseCase(injector()));

  /// Blocs
  injector.registerLazySingleton<CoinListBloc>(() => CoinListBloc( injector()));

}
