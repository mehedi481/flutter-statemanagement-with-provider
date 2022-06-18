import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/favourite_item_provider.dart';
import 'package:flutter_statemanagement_provider/screens/favourite/fav_action_screen.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("widget build");
    return Scaffold(
        appBar: AppBar(title: const Text("Favorite Items"), actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const FavItems())));
              },
              icon: const Icon(Icons.favorite)),
        ]),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: ((context, index) {
              return Consumer<FavouriteItemProvider>(
                  builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.selectedItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                  },
                  title: Text("intem index $index"),
                  trailing: value.selectedItem.contains(index)
                      ? const Icon(Icons.favorite,color: Colors.red,)
                      : const Icon(Icons.favorite_border_outlined),
                );
              });
            })));
  }
}
