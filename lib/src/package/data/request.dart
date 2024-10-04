import 'dart:async';

enum RequestType {
  post("POST"),
  get("GET"),
  put("PUT"),
  delete("DELETE"),
  patch("PATCH"),
  copy("COPY"),
  head("HEAD"),
  options("OPTIONS"),
  link("LINK"),
  unlink("UNLINK"),
  purge("PURGE"),
  lock("LOCK"),
  unlock("UNLOCK"),
  view("VIEW");

  final String value;
  const RequestType(this.value);
}

typedef ResponseParser<T> = FutureOr<T> Function(dynamic responseData);

T _defaultResponseParser<T>(dynamic responseData) => responseData as T;

base class NetworkRequest<T extends Object?> {
  NetworkRequest(
    this.requestType,
    this.path, {
    this.headers,
    this.queryParams,
    this.pathParams,
    this.data,
    this.onReceiveProgress,
    this.onSendProgress,
    ResponseParser<T>? responseParser,
  }) : responseParser = responseParser ?? _defaultResponseParser;

  final RequestType requestType;
  final String path;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? queryParams;
  Map<String, String>? pathParams;
  Object? data;
  ResponseParser<T> responseParser;
  void Function(int, int)? onReceiveProgress;
  void Function(int, int)? onSendProgress;
}
