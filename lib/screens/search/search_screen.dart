import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Map<String, dynamic>> list;

  final List<Map<String, dynamic>> itemList = [
    {"name": "Mehedi Hasan", "country": "Bangladesh"},
    {"name": "Hasan", "country": "India"},
    {"name": "MH", "country": "US"},
    {"name": "Mehedi H", "country": "UK"},
    {"name": "Minhaz", "country": "Bangladesh"},
    {"name": "Mehedi Hasan", "country": "Bangladesh"},
    {"name": "Hasan", "country": "India"},
    {"name": "MH", "country": "US"},
    {"name": "Mehedi H", "country": "UK"},
    {"name": "Minhaz", "country": "Bangladesh"},
  ];

  @override
  void initState() {
    super.initState();
    list = itemList;
  }

  _searchFilter(String value) {
    List<Map<String, dynamic>> results = [];
    if (value.isEmpty || value == "" ) {
      results = itemList;
      print("value");
    } else {
      results = itemList
          .where((data) =>
              data["name"].toLowerCase().contains(value.toLowerCase()) ||
              data["country"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      list = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchFilter,
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
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    '${index + 1} ${list[index]['name']}',
                  ),
                  subtitle: Text(
                    itemList[index]['country'],
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
