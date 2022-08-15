import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modularization/blocs/blocs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stocks_symbol_module/stocks_symbol_module.dart';

import '../../mocks/mocks.dart';

// @GenerateMocks([BaseStockRepository])
void main() {
  final _blocs = <StockSymbolCubit>[];

  late MockBaseStockRepository _mockStockRepository;
  // final fakeRequestOptions = RequestOptions(path: 'path');

  setUpAll(() {
    _mockStockRepository = MockBaseStockRepository();
  });

  tearDown(() {
    for (final bloc in _blocs) {
      bloc.close();
    }
  });

  final _mockStockSymbolResponse = StocksSymbol(
    currency: "mock currency",
    description: "mock description",
    displaySymbol: "mock display symbol",
    figi: "mock figi",
    symbol: "mock symbol",
  );

  StockSymbolCubit _buildNormalStockSymbolListDataResponse() {
    when(_mockStockRepository.getStockSymbolList(exchange: "JK"))
        .thenAnswer((_) => Future.value([
              _mockStockSymbolResponse,
              _mockStockSymbolResponse,
            ]));

    final bloc = StockSymbolCubit(
      stockRepository: _mockStockRepository,
    );

    _blocs.add(bloc);

    return bloc;
  }

  StockSymbolCubit _buildNormalStockSymbolEmptyResponse() {
    when(_mockStockRepository.getStockSymbolList(exchange: "JK"))
        .thenAnswer((_) => Future.value([]));

    final bloc = StockSymbolCubit(
      stockRepository: _mockStockRepository,
    );

    _blocs.add(bloc);

    return bloc;
  }

  StockSymbolCubit _buildNormalStockSymbolErrorResponse() {
    when(_mockStockRepository.getStockSymbolList(exchange: "JK"))
        .thenThrow(Error);

    final bloc = StockSymbolCubit(
      stockRepository: _mockStockRepository,
    );

    _blocs.add(bloc);

    return bloc;
  }

  group('stock_symbol_cubit_test.dart', () {
    group('Given: No Exception Happen', () {
      blocTest<StockSymbolCubit, BaseState>(
        'When: getData() - Then: LoadedState()',
        build: _buildNormalStockSymbolListDataResponse,
        act: (cubit) => cubit.getData(exchange: "JK"),
        expect: () => [
          isA<LoadingState>(),
          isA<LoadedState>(),
        ],
      );

      blocTest<StockSymbolCubit, BaseState>(
        'When: getData() - Then: EmptyState()',
        build: _buildNormalStockSymbolEmptyResponse,
        act: (cubit) => cubit.getData(exchange: "JK"),
        expect: () => [
          isA<LoadingState>(),
          isA<EmptyState>(),
        ],
      );
    });

    group('Given: With Exception Happen', () {
      blocTest<StockSymbolCubit, BaseState>(
        'When: getData() - Then: ErrorState()',
        build: _buildNormalStockSymbolErrorResponse,
        act: (cubit) => cubit.getData(exchange: "JK"),
        expect: () => [
          isA<LoadingState>(),
          isA<ErrorState>(),
        ],
      );
    });
  });
}
