import 'package:breaking_bad_app/data/models/error_message_model.dart';

class ApiResult<T> {
  T? data;
  ErrorMessageModel? error;
  ApiResult({this.data, this.error});
}
