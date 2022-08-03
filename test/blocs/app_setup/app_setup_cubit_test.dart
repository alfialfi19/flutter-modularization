import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modularization/blocs/blocs.dart';
import 'package:flutter_modularization/commons/commons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final _cubits = <AppSetupCubit>[];

  tearDownAll(() {
    for (final cubit in _cubits) {
      cubit.close();
    }
  });

  AppSetupCubit _buildNormalSetupCubit() {
    // when(_mockFirebaseClient.getFCMToken())
    //     .thenAnswer((_) async => Future.value("TOKEN"));
    //
    final cubit = AppSetupCubit();

    _cubits.add(cubit);
    return cubit;
  }

  group('app_setup_cubit_test.dart', () {
    group('Given: No Exception Happen', () {
      blocTest<AppSetupCubit, AppSetupState>(
        'When: initialize() - Then: AppSetupState.SUCCESS',
        build: _buildNormalSetupCubit,
        act: (cubit) => cubit.initialize(),
        expect: () => [AppSetupState.success],
      );
    });
  });
}
