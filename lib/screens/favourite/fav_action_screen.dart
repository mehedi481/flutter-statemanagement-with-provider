import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/favourite_item_provider.dart';
import 'package:provider/provider.dart';

class FavItems extends StatefulWidget {
  const FavItems({Key? key}) : super(key: key);

  @override
  State<FavItems> createState() => _FavItemsState();
}

class _FavItemsState extends State<FavItems> {
  @override
  Widget build(BuildContext context) {
    // final _favItemProvider = Provider.of<FavouriteItemProvider>(context, listen: true);
        print("widget build");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Items"),
        ),
        body: Consumer<FavouriteItemProvider>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.selectedItem.length,
              // context.watch<FavouriteItemProvider>().selectedItem.length,
              // itemCount: _favItemProvider.selectedItem.length,
              itemBuilder: ((context, index) {
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
              }));
        }));
  }
}
