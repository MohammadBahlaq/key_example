import 'package:flutter/material.dart';
import 'package:key_example/stateless_widget.dart';

class KeyExample extends StatefulWidget {
  const KeyExample({super.key});

  @override
  State<KeyExample> createState() => _KeyExampleState();
}

class _KeyExampleState extends State<KeyExample> {
  late List<Widget> widgets;

  bool useKeys = false;

  @override
  void initState() {
    super.initState();
    buildWidgets();
  }

  void buildWidgets() {
    widgets = [
      ColoredBoxStatelessWidget(key: useKeys ? const ValueKey("1") : null),
      ColoredBoxStatelessWidget(key: useKeys ? const ValueKey("2") : null),
    ];
  }

  void swap() {
    setState(() {
      widgets.insert(1, widgets.removeAt(0));
    });
  }

  void toggleKeys() {
    setState(() {
      useKeys = !useKeys;
      buildWidgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Demo'),
        actions: [
          Switch(
            value: useKeys,
            onChanged: (_) => toggleKeys(),
            activeColor: Colors.green,
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swap,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
