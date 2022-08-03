import 'dart:async';
import 'dart:developer';

import 'package:core_package/core_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modularization/my_app.dart';

import 'commons/commons.dart';
import 'repositories/repositories.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiation
  final BaseApiClient _apiClient = DioClient.instance;

  /// Change Base Url Here
  const String _baseUrl = EnvConfig.baseProdUrl;

  // Repositories instantiation
  final BaseStockRepository _stockRepository = StockRepository(
    baseUrl: _baseUrl,
    apiClient: _apiClient,
  );

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runZonedGuarded(
    () => runApp(
      MyApp(
        //Client
        apiClient: _apiClient,
        // localStorageClient: _localStorageClient,
        // firebaseClient: _firebaseClient,
        //Repository
        stockRepository: _stockRepository,
        // searchRepository: _searchRepository,
        // authRepository: _authRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
