import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print("widget build");
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<ExampleOneProvider>(builder: (context, value, child) {
          return Slider(
              value: value.value,
              onChanged: (val) {
                value.changeValue(val);
              });
        }),
        Consumer<ExampleOneProvider>(builder: (context, value, child) {
          return Center(
            child: Text("Slider Value: ${value.value}"),
          );
        }),
        Consumer<ExampleOneProvider>(builder: (context, value, child) {
          return Center(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red.withOpacity(value.value),
                    height: 100,
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue.withOpacity(value.value),
                    height: 100,
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }
}
