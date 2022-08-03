import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class StockSymbolCubit extends Cubit<BaseState> {
  final BaseStockRepository stockRepository;

  StockSymbolCubit({
    // required this.localStorageClient,
    required this.stockRepository,
  }) : super(InitializedState());

  /// Get List of Stock Symbol
  void getData({
    required String exchange,
  }) async {
    emit(LoadingState());

    List<StocksSymbol> _results = [];

    /// Get data from repository
    try {
      _results = await stockRepository.getStockSymbolList(exchange: exchange);

      if (_results.isEmpty) {
        emit(EmptyState());
        return;
      }
    } catch (e, s) {
      debugPrint("===> Error $e");
      debugPrint("===> Error $s");
      emit(
        ErrorState(
          error: '$this - Get List Stocks Symbol Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    /// All validate pass
    emit(
      LoadedState(
        data: _results,
        timestamp: DateTime.now(),
      ),
    );
  }
}
