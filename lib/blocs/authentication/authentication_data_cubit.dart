import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons.dart';
import '../blocs.dart';

part 'authentication_state.dart';

class AuthenticationDataCubit extends Cubit<BaseState<UserApp>> {
  final AppSetupCubit appSetupCubit;

  late StreamSubscription appSetupCubitSubs;

  AuthenticationDataCubit({
    required this.appSetupCubit,
  }) : super(InitializedState()) {
    appSetupCubitSubs = appSetupCubit.stream.listen((state) {
      if (state == AppSetupState.success) {
        initialize();
      }
    });
  }

  @override
  Future<void> close() {
    appSetupCubitSubs.cancel();
    return super.close();
  }

  void initialize() async {
    String? _rawUserData;
    UserApp? _userData;

    /// Get & Check Local UserData
    try {
      ///TODO: Get User Data
      // _rawUserData = await localStorageClient.getByKey(
      //   SharedPrefKey.userData,
      //   SharedPrefType.string,
      // );
      _rawUserData = null;

      debugPrint('[$this - getUserData] - Result : $_rawUserData');

      if (_rawUserData == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e, s) {
      debugPrint("--->  error e: $e");
      debugPrint("--->  error s: $s");
      emit(UnauthenticatedState());
      return;
    }

    // /// Parse Raw User Data To Model
    // try {
    //   _userData = UserApp.fromJson(jsonDecode(_rawUserData));
    //   debugPrint('[$this] - Get User Name : ${_userData.username}');
    //
    //   if (_userData.email == null) {
    //     emit(UnauthenticatedState());
    //     return;
    //   }
    // } catch (e, s) {
    //   debugPrint("---> Enter error e: $e");
    //   debugPrint("---> Enter error s: $s");
    //   emit(UnauthenticatedState());
    //   return;
    // }

    /// All Passed
    emit(
      AuthenticatedState(
        data: _userData,
        timestamp: DateTime.now(),
      ),
    );
  }
}
