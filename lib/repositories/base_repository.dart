import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dio/token.interceptor.dart';

abstract class RepositoryBase {
  @protected
  final dio = Dio(BaseOptions(
    baseUrl: "https://stronzo-tapegandofogo-core-dev.azurewebsites.net",
    sendTimeout: 10000,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  ));
}

abstract class ProviderRepositoryBase extends RepositoryBase {
  final Reader read;

  ProviderRepositoryBase(this.read) {
    dio.interceptors.add(TokenInterceptor(read));
  }
}
