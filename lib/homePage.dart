import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        x++;
      });
      print(x);
    });
  }

  //NOTE: Here every second widget rebuild and it very bad for an app.
  //see on the terminal how many time widget build

  @override
  Widget build(BuildContext context) {
    print("build widget "+x.toString());
    return Scaffold(
      appBar: AppBar(title: const Text("State Management with Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString() + ":"+ DateTime.now().second.toString() ,
            style: TextStyle(fontSize: 50),
          ),
          const Center(child: Text("Home Page body")),
          Text(
            "$x",
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
