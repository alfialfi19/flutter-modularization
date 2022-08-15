part of 'base_stock_repository.dart';

class StockRepository extends BaseStockRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  StockRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<StocksSymbol>> getStockSymbolList({
    required String exchange,
  }) async {
    List<StocksSymbol> _results = [];

    print(
        "====> url: ${baseUrl + Url.stocksSymbolRepository + '?exchange=$exchange'}");
    print("====> openApiKey: ${EnvConfig.openApiKey}");

    Response fetchData = await apiClient.get(
      baseUrl + Url.stocksSymbolRepository + "?exchange=$exchange",
      headers: {
        "X-Finnhub-Token": EnvConfig.openApiKey,
      },
    );

    if (fetchData.data != null) {
      List _rawData = fetchData.data;
      for (Map singleData in _rawData) {
        _results.add(
          StocksSymbol.fromJson(
            Map<String, dynamic>.from(
              singleData,
            ),
          ),
        );
      }
    }

    return _results;
  }
}
