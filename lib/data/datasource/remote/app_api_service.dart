import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/data/models/response/coin_response.dart';

part 'app_api_service.g.dart';

@RestApi()
abstract class AppApiService {
  factory AppApiService(Dio dio) = _AppApiService;

  @GET('/assets')
  Future<HttpResponse<CoinResponse>> fetchAllCoins(
      @Query("offset") int offset, @Query("limit") int limit);
}
