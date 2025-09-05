import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/core/data_state.dart';

extension HttpResponseUtils on HttpResponse {
  DataFailed<T> formatErrorFromResponse<T>() {
    return DataFailed<T>(
      response.statusMessage ?? '',
      error: DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
      ),
    );
  }
}

extension ResponseUtils on Response {
  bool isSuccessful() {
    return 200 <= statusCode! && statusCode! < 300;
  }
}

Future<DataState<ReturnType>> doSafeApiCall<ReturnType, ResponseType>(
    Future<HttpResponse<ResponseType>> Function() apiCall,
    ReturnType Function(ResponseType responseData) mapResponse,
    {Function(ResponseType responseData)? extraSuccessAction}) async {
  try {
    final response = await apiCall();
    if (response.response.isSuccessful()) {
      if (extraSuccessAction != null) extraSuccessAction(response.data);
      return DataSuccess(mapResponse(response.data));
    }
   /// LOG
    return response.formatErrorFromResponse();
  } on DioException catch (e) {
    /// LOG
    if (e.response?.data != null && e.response!.data.toString().isNotEmpty) {
      dynamic errorJson;
      if (e.response?.data is String) {
     //   errorJson = json.decode(e.response!.data);
      } else {
        errorJson = e.response?.data;
      }
      //return DataFailed(ErrorResponse.fromJson(errorJson).error.toString(), error: e);
      return DataFailed("", error: e);
    } else {
      //return DataFailed(e.message, error: e);
      return DataFailed("", error: e);
    }
  } catch (e) {
    /// LOG
    return DataFailed(e.toString());
  }
}
