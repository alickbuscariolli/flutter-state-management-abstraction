import 'package:abstract_state_management/core/state_management/abstraction/state_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitStateManagement<T> extends Cubit<T> implements StateManagement<T> {
  T _state;

  CubitStateManagement(this._state) : super(_state);

  @override
  T get state => _state;

  @override
  void set(T state) {
    _state = state;
    emit(state);
  }

  @override
  StateManagementDispose listen(void Function(T) listener) {
    stream.listen(listener);

    return () => close();
  }

  @override
  void dispose() {
    close();
  }
}
