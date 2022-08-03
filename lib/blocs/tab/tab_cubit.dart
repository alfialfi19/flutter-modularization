import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons.dart';

/// Cubit for handling tab interaction
/// We can add more logic as the user tap the tab
class TabCubit extends Cubit<AppTab> {
  TabCubit() : super(AppTab.home);

  /// Change tab
  void changeTab({
    required AppTab tab,
  }) {
    emit(tab);
  }
}
