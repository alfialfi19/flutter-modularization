import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modularization/blocs/blocs.dart';
import 'package:flutter_modularization/widgets/widgets.dart';

import '../commons/commons.dart';
import '../repositories/repositories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockSymbolCubit(
        stockRepository: context.read<BaseStockRepository>(),
      )..getData(
          exchange: "JK",
        ),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => context.read<StockSymbolCubit>()
          ..getData(
            exchange: "JK",
          ),
        child: ListView(
          children: [
            _sectionHeader(),
            const SizedBox(
              height: 15.0,
            ),
            // const ContainerSearchBar(),
            // const SizedBox(
            //   height: 15.0,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Stocks",
                    style: FontHelper.custom(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Palette.finnHubSecondary,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _sectionContent(context),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader() {
    return Container(
      height: 100.0,
      width: double.maxFinite,
      color: Palette.finnHubBackgroundDark,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          Images.iconFinnhub,
          height: 200.0,
          width: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _sectionContent(BuildContext context) {
    return BlocBuilder<StockSymbolCubit, BaseState>(
      builder: (context, state) {
        List<StocksSymbol>? _resultsData;

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Palette.finnHubSecondary,
            ),
          );
        }

        if (state is EmptyState) {
          // return const EmptyOrErrorData(
          //   category: StateCategory.empty,
          // );
          return const Center(
            child: Text("Whoops, something wrong"),
          );
        }

        if (state is ErrorState) {
          // return EmptyOrErrorData(
          //   category: StateCategory.error,
          //   action: () async => context.read<StockSymbolDataCubit>()
          //     ..getData(
          //       exchange: "JK",
          //     ),
          // );
          return const Center(
            child: Text("Whoops, something wrong"),
          );
        }

        if (state is LoadedState) {
          _resultsData = state.data;
        }

        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _resultsData?.length,
          itemBuilder: (context, index) {
            return CardStock(
              stocks: _resultsData?[index],
            );
          },
        );
      },
    );
  }
}
