import 'package:dio/dio.dart';
import 'package:flutter_modularization/commons/commons.dart';
import 'package:flutter_modularization/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.dart';

// @GenerateMocks([DioClient()])
void main() {
  late MockBaseApiClient apiClient;
  late String baseUrl;
  late BaseStockRepository stockRepository;

  setUpAll(() {
    apiClient = MockBaseApiClient();
    baseUrl = 'https://finnhub.io/api/v1/';
    stockRepository = StockRepository(
      apiClient: apiClient,
      baseUrl: baseUrl,
    );
  });

  const _mockStockSymbolResponse = <String, dynamic>{
    "data": [
      {
        "currency": "IDR",
        "description": "BHAKTI AGUNG PROPERTINDO TBK",
        "displaySymbol": "BAPI.JK",
        "figi": "BBG00PZ863G8",
        "isin": null,
        "mic": "XIDX",
        "shareClassFIGI": "BBG00PZ863J5",
        "symbol": "BAPI.JK",
        "symbol2": "",
        "type": "Common Stock"
      },
      {
        "currency": "IDR",
        "description": "POOL ADVISTA INDONESIA TBK",
        "displaySymbol": "POOL.JK",
        "figi": "BBG000BG4JV1",
        "isin": null,
        "mic": "XIDX",
        "shareClassFIGI": "BBG001S6WRH0",
        "symbol": "POOL.JK",
        "symbol2": "",
        "type": "Common Stock"
      },
    ],
  };

  const _mockStockSymbolEmptyResponse = <String, dynamic>{
    "data": [],
  };

  group('stock_symbol_repository_test.dart', () {
    group('Given: No Exception Happen', () {
      test('When: getData - Then: List<StocksSymbol>()', () async {
        /// Initial Var
        List<StocksSymbol>? results;
        bool isError = false;

        /// Stubbing
        when(apiClient.get(
          "$baseUrl${Url.stocksSymbolRepository}?exchange=JK",
          headers: {
            "X-Finnhub-Token": EnvConfig.openApiKey,
          },
        )).thenAnswer((_) async => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: '',
                ),
                data: [
                  _mockStockSymbolResponse,
                  _mockStockSymbolResponse,
                ],
              ),
            ));

        /// Action
        try {
          results = await stockRepository.getStockSymbolList(
            exchange: "JK",
          );
        } catch (e) {
          isError = true;
        }

        /// Expect
        expect(isError, false);
        expect(results != null, true);
      });

      test('When: getData - Then: EmptyData', () async {
        /// Initial Var
        List<StocksSymbol>? results;
        bool isError = false;

        /// Stubbing
        when(apiClient.get(
          "$baseUrl${Url.stocksSymbolRepository}?exchange=JK",
          headers: {
            "X-Finnhub-Token": EnvConfig.openApiKey,
          },
        )).thenAnswer((_) async => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: '',
                ),
                data: [],
              ),
            ));

        /// Action
        try {
          results = await stockRepository.getStockSymbolList(
            exchange: "JK",
          );
        } catch (e) {
          isError = true;
        }

        /// Expect
        expect(isError, false);
        expect(results != null, true);
      });
    });

    group('Given: With Exception Happen', () {
      test('When: getData - Then: ThrowError', () async {
        /// Initial Var
        List<StocksSymbol>? results;
        bool isError = false;

        /// Stubbing
        when(apiClient.get(
          "$baseUrl${Url.stocksSymbolRepository}?exchange=JK",
          headers: {
            "X-Finnhub-Token": EnvConfig.openApiKey,
          },
        )).thenThrow(Error);

        /// Action
        try {
          results = await stockRepository.getStockSymbolList(
            exchange: "JK",
          );
        } catch (e) {
          isError = true;
        }

        /// Expect
        expect(isError, true);
        expect(results, null);
      });
    });
  });
}
