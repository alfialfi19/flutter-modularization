import 'package:equatable/equatable.dart';

/// Base class for all states used in the blocs
abstract class BaseStateProfile<T> extends Equatable {
  final T? data;
  final DateTime? timestamp;

  BaseStateProfile({
    this.data,
    this.timestamp,
  });

  @override
  List<Object?> get props => [
        data,
        timestamp,
      ];
}

/// Default state
///
/// Use it for initialization of the bloc
class InitializedState<T> extends BaseStateProfile<T> {
  InitializedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'InitializeState { timestamp: $timestamp, data: $data }';
  }
}

/// Main loading state
///
/// If the screen loads multiple data and needs more than one loading state,
/// consider creating another micro loading state on the corresponding blocs
class LoadingState<T> extends BaseStateProfile<T> {
  LoadingState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  String toString() {
    return 'LoadingState { timestamp: $timestamp, data: $data }';
  }
}

/// Main success state for load data to the screen
///
/// If the screen loads multiple data and needs more than one loaded state,
/// consider creating another micro loaded state on the corresponding blocs
///
/// To indicate empty data, please consider use [EmptyState] instead of doing
/// length checking on this state.
class LoadedState<T> extends BaseStateProfile<T> {
  LoadedState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'LoadedState { timestamp: $timestamp, data: $data,}';
  }
}

/// Success state for action bloc
///
/// Don't use this state for blocs that responsible for loading data to the screen.
class SuccessState<T> extends BaseStateProfile<T> {
  SuccessState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'SuccessState { timestamp: $timestamp, data: $data,}';
  }
}

/// Main empty state
///
/// Use this state for indicate empty data if the data successfully loaded.
class EmptyState<T> extends BaseStateProfile<T> {
  EmptyState({
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'EmptyState { timestamp: $timestamp, data: $data }';
  }
}

/// Main error state
///
/// Use this state to indicate failure on every blocs.
///
/// If the screen loads multiple data and needs more than one error state,
/// consider creating another micro error state on the corresponding blocs
class ErrorState<T> extends BaseStateProfile<T> {
  /// Error message is enforced to be provided for UX clarity
  final String error;

  ErrorState({
    required this.error,
    DateTime? timestamp,
    T? data,
  }) : super(
          timestamp: timestamp,
          data: data,
        );

  @override
  String toString() {
    return 'ErrorState { timestamp: $timestamp, data: $data }';
  }
}
