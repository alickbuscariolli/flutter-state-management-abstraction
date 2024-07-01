import 'package:abstract_state_management/core/state_management/state_managements/value_notifier_state_management.dart';

class CounterController extends ValueNotifierStateManagement<int> {
  CounterController() : super(0);

  void increment() {
    set(state + 1);
  }

  void decrement() {
    set(state - 1);
  }
}
