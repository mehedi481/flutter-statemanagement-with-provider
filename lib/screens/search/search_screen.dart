import 'package:flutter/material.dart';
import 'package:flutter_statemanagement_provider/provider/search_or_filter_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // _searchFilter(String value) {
  //   List<Map<String, dynamic>> results = [];
  //   if (value.isEmpty || value == "") {
  //     results = itemList;
  //     print("value");
  //   } else {
  //     results = itemList
  //         .where((data) =>
  //             data["name"].toLowerCase().contains(value.toLowerCase()) ||
  //             data["country"].toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {
  //     list = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _list = context.watch<SearchProvider>().list;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: TextField(
              controller: _searchController,
              onChanged: context.watch<SearchProvider>().filterSearch,
              decoration: InputDecoration(
                hintText: "Search what ever you want",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: size.width * 0.95,
              height: 250,
              color: Colors.orange,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    '${index + 1} ${_list[index]['name']}',
                  ),
                  subtitle: Text(
                    _list[index]['country'],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
