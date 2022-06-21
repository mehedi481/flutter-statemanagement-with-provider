import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<ThemeProvider>().changeTheme("system");
                },
                color: const Color.fromARGB(255, 14, 24, 141),
                child: const Text("System"),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<ThemeProvider>().changeTheme("light");
                },
                color: Colors.blue,
                child: const Text("Light"),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<ThemeProvider>().changeTheme("dark");
                },
                color: Colors.black,
                child: const Text(
                  "Dark",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
      ),
    );
  }
}
