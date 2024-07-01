import 'package:abstract_state_management/core/state_management/state_managements/value_notifier_state_management.dart';
import 'package:flutter/material.dart';

class WatcherWidget<T> extends StatefulWidget {
  final ValueNotifierStateManagement<T> listenable;
  final Widget Function(BuildContext context, T state) builder;

  const WatcherWidget({super.key, required this.builder, required this.listenable});

  @override
  State<WatcherWidget<T>> createState() => _WatcherWidgetState<T>();
}

class _WatcherWidgetState<T> extends State<WatcherWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: widget.listenable.valueNotifier,
      builder: (context, state, __) {
        return widget.builder(context, state);
      },
    );
  }
}
