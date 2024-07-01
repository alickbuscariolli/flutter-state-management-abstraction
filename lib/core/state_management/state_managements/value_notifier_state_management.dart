import 'package:abstract_state_management/core/state_management/abstraction/state_management.dart';
import 'package:flutter/material.dart';

abstract class ValueNotifierStateManagement<T> implements StateManagement<T> {
  T _state;

  final ValueNotifier<T> valueNotifier;

  ValueNotifierStateManagement(this._state) : valueNotifier = ValueNotifier(_state);

  @override
  void dispose() {
    valueNotifier.dispose();
  }

  @override
  StateManagementDispose listen(void Function(T p1) listener) {
    void listenerLocal() {
      listener(_state);
    }

    valueNotifier.addListener(listenerLocal);

    return () => valueNotifier.removeListener(listenerLocal);
  }

  @override
  void set(T state) {
    _state = state;
    valueNotifier.value = state;
  }

  @override
  T get state => _state;
}
