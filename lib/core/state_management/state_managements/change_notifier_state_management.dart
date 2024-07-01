import 'package:abstract_state_management/core/state_management/abstraction/state_management.dart';
import 'package:flutter/material.dart';

abstract interface class ChangeNotifierStateManagement<T> implements StateManagement<T> {
  T _state;

  final changeNotifier = ChangeNotifier();

  ChangeNotifierStateManagement(this._state);

  @override
  void dispose() {
    changeNotifier.dispose();
  }

  @override
  StateManagementDispose listen(void Function(T p1) listener) {
    void listenerLocal() {
      listener(_state);
    }

    changeNotifier.addListener(listenerLocal);

    return () => changeNotifier.removeListener(listenerLocal);
  }

  @override
  void set(T state) {
    _state = state;
    changeNotifier.notifyListeners();
  }

  @override
  T get state => _state;
}
