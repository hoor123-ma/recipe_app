import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/data/models/api_result.dart';
import 'package:breaking_bad_app/data/web_service/api_error_handler.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:dio/dio.dart'; // ignore_for_file: public_member_api_docs, sort_constructors_first

class RecipesWebService {
  final Dio dio;
  RecipesWebService({required this.dio}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: 2),
      connectTimeout: Duration(seconds: 2),
      receiveDataWhenStatusError: true,
    );
    dio.options = options;
  }

  Future<ApiResult> getRecipesResponse() async {
    try {
      Response response = await dio.get("");
      return ApiResult(data: response.data);
    } on Exception catch (e) {
      return ApiResult(error: ApiErrorHandler(exception: e).getErrorMessage());
    }
  }
}
