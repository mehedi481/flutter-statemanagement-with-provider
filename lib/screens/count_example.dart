import "package:flutter/material.dart";
import 'package:flutter_statemanagement_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExampleScreen extends StatelessWidget {
  const CountExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context,value,_) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          }
        ),
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
