import 'package:core_module/core_module.dart';
import 'package:dio/dio.dart';

import '../../commons/commons.dart';

part 'stock_repository.dart';

abstract class BaseStockRepository {
  Future<List<StocksSymbol>> getStockSymbolList({
    required String exchange,
  });
}
