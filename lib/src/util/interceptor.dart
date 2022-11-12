import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:my_time/src/application/connectivity_service.dart';
import 'package:my_time/src/exceptions/no_internet_exception.dart';
import 'package:my_time/src/util/api_key_container.dart';

class AppRequestInterceptor implements RequestInterceptor {
  ApiKeyContainer apiKeyContainer;

  AppRequestInterceptor({required this.apiKeyContainer});

  @override
  FutureOr<Request> onRequest(Request request) async {
    var _isConnected = await checkConnectivity();
    if (!_isConnected) throw NoInternetException();
    var customHeaders = {
      'content-type': 'application/json',
      'X-Api-Key': apiKeyContainer.getApiKey
    };
    final newRequest = request.copyWith(headers: customHeaders);
    return newRequest;
  }
}
