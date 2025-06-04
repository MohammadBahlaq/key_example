import 'dart:math';

import 'package:flutter/material.dart';

class ColoredBoxStatefulWidget extends StatefulWidget {
  const ColoredBoxStatefulWidget({super.key});

  @override
  State<ColoredBoxStatefulWidget> createState() =>
      _ColoredBoxStatefulWidgetState();
}

class _ColoredBoxStatefulWidgetState extends State<ColoredBoxStatefulWidget> {
  late final Color color;

  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      color: color,
      alignment: Alignment.center,
      child: Text("Stateful"),
    );
  }
}
