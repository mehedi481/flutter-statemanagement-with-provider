import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/count_provider.dart';
import 'package:flutter_statemanagement_provider/screens/count_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,

        ),
        home: const CountExampleScreen(),
        
      ),
    );
  }
}