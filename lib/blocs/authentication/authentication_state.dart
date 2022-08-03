part of 'authentication_data_cubit.dart';

/// State for indicating user needs to sign in
class UnauthenticatedState<T> extends BaseState<T> {
  UnauthenticatedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'UnauthenticatedState { timestamp: $timestamp, data: $data }';
  }
}

/// State for indicating user already signed-in
class AuthenticatedState<T> extends BaseState<T> {
  AuthenticatedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'AuthenticatedState { timestamp: $timestamp, data: $data }';
  }
}
