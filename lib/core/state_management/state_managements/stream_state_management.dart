import 'dart:async';

import 'package:abstract_state_management/core/state_management/abstraction/state_management.dart';

abstract class StreamStateManagement<T> implements StateManagement<T> {
  final streamController = StreamController<T>.broadcast();

  T _state;

  StreamStateManagement(this._state);

  @override
  T get state => this._state;

  @override
  void set(T value) {
    _state = value;
    streamController.add(state);
  }

  @override
  Future<void> Function() listen(void Function(T) listener) {
    final sub = streamController.stream.listen(listener);

    return () => sub.cancel();
  }

  @override
  void dispose() {
    streamController.close();
  }
}
