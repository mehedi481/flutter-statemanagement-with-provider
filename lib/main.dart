import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/count_provider.dart';
import 'package:flutter_statemanagement_provider/provider/example_one_provider.dart';
import 'package:flutter_statemanagement_provider/provider/favourite_item_provider.dart';
import 'package:flutter_statemanagement_provider/provider/theme_provider.dart';
import 'package:flutter_statemanagement_provider/screens/favourite/favourite_screen.dart';
import 'package:flutter_statemanagement_provider/screens/theme_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,value,_) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
              appBarTheme: const AppBarTheme(color: Colors.red),
            ),
            themeMode: value.themeMode,
            home: const ThemeScreen(),
          );
        }
      ),
    );
  }
}
