import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenArgument {
  final BlocBase<Object?>? bloc;
  final Object? data;

  ScreenArgument({this.bloc, this.data});
}
