import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/count_provider.dart';
import 'package:flutter_statemanagement_provider/provider/example_one_provider.dart';
import 'package:flutter_statemanagement_provider/provider/favourite_item_provider.dart';
import 'package:flutter_statemanagement_provider/screens/count_example.dart';
import 'package:flutter_statemanagement_provider/screens/example_one.dart';
import 'package:flutter_statemanagement_provider/screens/favourite/favourite_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => CountProvider(),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,

    //     ),
    //     home:  ExampleOneScreen(),

    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteItemProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FavouriteScreen(),
      ),
    );
  }
}
