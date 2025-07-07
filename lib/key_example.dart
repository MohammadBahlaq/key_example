import 'package:flutter/material.dart';
import 'package:key_example/stateful_widget.dart';

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
      ///Local keys
      ColoredBoxStatefulWidget(
        key: useKeys ? ValueKey(1) : null,
        text: 'Stateful 1',
      ),
      ColoredBoxStatefulWidget(
        key: useKeys ? ValueKey(2) : null,
        text: 'Stateful 2',
      ),

      // ColoredBoxStatefulWidget(key: useKeys ? ValueKey(1) : null),
      // ColoredBoxStatefulWidget(key: useKeys ? UniqueKey() : null),
    ];
  }

  void swap() {
    setState(() {
      //537
      //421
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
        child: const Icon(Icons.swap_horiz_rounded),
      ),
    );
  }
}
