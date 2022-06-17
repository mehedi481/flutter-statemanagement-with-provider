import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_statemanagement_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExampleScreen extends StatefulWidget {
  const CountExampleScreen({Key? key}) : super(key: key);

  @override
  State<CountExampleScreen> createState() => _CountExampleScreenState();
}

class _CountExampleScreenState extends State<CountExampleScreen> {
  @override
  void initState() {
    super.initState();
    final _provider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      // context.read<CountProvider>().incrementCounterValue();

      // Another method to read provider value;
      _provider.incrementCounterValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, _) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountProvider>().incrementCounterValue();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
