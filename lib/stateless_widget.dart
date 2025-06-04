import 'dart:math';

import 'package:flutter/material.dart';

class ColoredBoxStatelessWidget extends StatelessWidget {
  ColoredBoxStatelessWidget({super.key});

  late final Color color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      color: color,
      alignment: Alignment.center,
      child: Text("Stateless"),
    );
  }
}
