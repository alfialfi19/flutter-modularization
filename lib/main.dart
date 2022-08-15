import 'dart:async';
import 'dart:developer';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_module/profile_module.dart';
// import 'package:profile_module/profile_module.dart';
import 'package:stocks_symbol_module/stocks_symbol_module.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiation
  final BaseApiClient _apiClient = DioClient.instance;

  /// Change Base Url Here
  const _baseUrl = EnvConfig.baseProdUrl;

  // Repositories instantiation
  final BaseStockRepository _stockRepository = StockRepository(
    baseUrl: _baseUrl,
    apiClient: _apiClient,
  );

  final BaseProfileRepository _profileRepository = ProfileRepository();

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
        profileRepository: _profileRepository,
        // searchRepository: _searchRepository,
        // authRepository: _authRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
