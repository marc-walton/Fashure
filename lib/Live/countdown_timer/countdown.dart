import 'package:flutter/material.dart';
import 'package:fashow/Live/countdown_timer/index.dart';

Widget _defaultCountdownBuilder(
  BuildContext context,
  Duration currentRemainingTime,
) {
  return Text('${currentRemainingTime?.inSeconds ?? 0}');
}

typedef CountdownWidgetBuilder = Widget Function(
    BuildContext context, Duration time);

class Countdown extends StatefulWidget {
  ///controller
  final CountdownController countdownController;
  ///custom widget builder
  final CountdownWidgetBuilder builder;

  Countdown({
    @required this.countdownController,
    this.builder = _defaultCountdownBuilder,
  });

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  CountdownWidgetBuilder get builder => widget.builder;

  CountdownController get countdownController => widget.countdownController;

  @override
  void initState() {
    super.initState();
    countdownController.addListener(() {
      setState(() {});
    });
  }

  Duration get time => countdownController.currentDuration;

  @override
  Widget build(BuildContext context) {
    assert(builder != null);
    return builder.call(context, time);
  }

  @override
  void dispose() {
    countdownController.dispose();
    super.dispose();
  }
}
