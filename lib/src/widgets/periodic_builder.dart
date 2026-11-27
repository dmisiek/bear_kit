import 'dart:async';

import 'package:flutter/widgets.dart';

/// {@template periodic_builder}
/// Calls [builder] again every [duration], e.g. to keep a relative time
/// label fresh without handling a timer by hand.
///
/// ```dart
/// PeriodicBuilder(
///   duration: const Duration(minutes: 1),
///   builder: (context) {
///     return Text(formatRelativeTime(createdAt));
///   },
/// );
/// ```
/// {@endtemplate}
class PeriodicBuilder extends StatefulWidget {
  /// {@macro periodic_builder}
  const new({
    required this.duration,
    required this.builder,
    super.key,
  });

  /// Interval between rebuilds.
  final Duration duration;

  /// Builds the widget on every tick.
  final WidgetBuilder builder;

  @override
  State<PeriodicBuilder> createState() => _PeriodicBuilderState();
}

class _PeriodicBuilderState extends State<PeriodicBuilder> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(PeriodicBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _timer.cancel();
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
