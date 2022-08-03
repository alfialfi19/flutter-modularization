import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons.dart';

class AppSetupCubit extends Cubit<AppSetupState> {
  AppSetupCubit() : super(AppSetupState.uninitialized);

  /// Initialize all setups that required by the application
  void initialize() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(AppSetupState.success);
    } catch (e) {
      emit(AppSetupState.failed);
    }
  }
}
