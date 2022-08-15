import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_module/profile_module.dart';
import 'package:stocks_symbol_module/stocks_symbol_module.dart';

import 'app_router.dart';
import 'blocs/blocs.dart';
import 'commons/commons.dart';

class MyApp extends StatelessWidget {
  final BaseApiClient apiClient;
  final BaseStockRepository stockRepository;
  final BaseProfileRepository profileRepository;

  const MyApp({
    required this.apiClient,
    required this.stockRepository,
    required this.profileRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => apiClient,
        ),
        RepositoryProvider(
          create: (context) => stockRepository,
        ),
        RepositoryProvider(
          create: (context) => profileRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSetupCubit()..initialize(),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              appSetupCubit: context.read<AppSetupCubit>(),
            ),
          ),
          BlocProvider(
            create: (context) => SignInCubit(
                // localStorageClient: localStorageClient,
                // authenticationRepository:
                // context.read<BaseAuthenticationRepository>(),
                ),
          ),
        ],
        child: const FlutterMyApp(),
      ),
    );
  }
}

class FlutterMyApp extends StatefulWidget {
  const FlutterMyApp({Key? key}) : super(key: key);

  @override
  State<FlutterMyApp> createState() => _FlutterMyAppState();
}

class _FlutterMyAppState extends State<FlutterMyApp> {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  DateTime? _lastUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (context, child) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationDataCubit, BaseState>(
                listener: (context, state) {
                  UserApp? user;

                  if (state is AuthenticatedState) {
                    if (_lastUser == null) {
                      _lastUser = state.timestamp;
                      user = state.data;
                      // Trigger Patch Change Tab
                      context.read<TabCubit>().changeTab(tab: AppTab.home);
                      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        RouteName.landingScreen,
                        (route) => false,
                        arguments: ScreenArgument(
                          data: UserApp(
                            email: user?.email,
                            name: user?.name,
                          ),
                        ),
                      );
                    }
                  }

                  if (state is UnauthenticatedState) {
                    _lastUser = null;
                    // Can navigate to login/register screen if needed
                    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      RouteName.signInScreen,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
            child: child!,
          ),
        );
      },
    );
  }
}
