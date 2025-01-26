import 'package:flutter/foundation.dart';
import 'package:incode_test_task/data/source/remote/api/network_service.dart';
import 'package:incode_test_task/data/source/remote/network_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _connectTimeout = 20000;
const _receiveTimeout = 20000;
const _sendTimeout = 20000;

NetworkService createNetworkService() {
  return NetworkService(
    Api.charactersEndpoint,
    connectTimeout: _connectTimeout,
    receiveTimeout: _receiveTimeout,
    sendTimeout: _sendTimeout,
    interceptors: [if (kDebugMode) _createLogger()],
  );
}

PrettyDioLogger _createLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  );
}
