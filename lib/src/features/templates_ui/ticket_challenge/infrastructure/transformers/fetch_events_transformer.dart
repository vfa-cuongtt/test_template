import 'package:dio/dio.dart';

//ignore_for_file: avoid_dynamic_calls

class FetchEventsTransformer extends DefaultTransformer {
  FetchEventsTransformer() : super();

  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody response,
  ) async {
    final dynamic responseBody =
        await super.transformResponse(options, response);
    final dynamic data = responseBody['data'];
    return data;
  }
}
