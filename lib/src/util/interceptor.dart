import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:my_time/src/util/api_key_container.dart';

class AppRequestInterceptor implements RequestInterceptor {
  // NDcxYjI1ZWUtMjEwNC00MmM1LTkxYzItNDZiYmQ0ZjMyNjEz

  @override
  FutureOr<Request> onRequest(Request request) async {
    // final connectivityResult = await Connectivity().checkConnectivity();

    // final isMobile = connectivityResult == ConnectivityResult.mobile;
    var customHeaders = {
      'content-type': 'application/json',
      'X-Api-Key': ApiKeyContainer.getApiKey
    };
    final newRequest = request.copyWith(headers: customHeaders);
    return newRequest;
  }
}
