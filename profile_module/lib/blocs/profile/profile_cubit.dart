import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class ProfileCubit extends Cubit<BaseStateProfile> {
  final BaseProfileRepository profileRepository;

  ProfileCubit({
    required this.profileRepository,
  }) : super(InitializedState());

  void getData() async {
    emit(LoadingState());

    UserApp? _result;
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    try {
      _result = await profileRepository.getUserData(
        token: "token",
      );
    } catch (e) {
      debugPrint("===> Error $e");
      emit(
        ErrorState(
          error: '$this - Get UserData] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    /// All validate pass
    emit(
      LoadedState(
        data: _result,
        timestamp: DateTime.now(),
      ),
    );
  }
}
