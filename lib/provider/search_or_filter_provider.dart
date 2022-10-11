import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  final List<Map<String, dynamic>> mainList = [
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

  late List<Map<String, dynamic>> _list;
  List<Map<String, dynamic>> get list => _list;

  filterSearch(String value) {
    List<Map<String, dynamic>> results = [];
    if (value == '' || value.isEmpty) {
      results = mainList;
    } else {
      results = mainList
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    _list = results;
    print("Filter List $_list");
    notifyListeners();
  }

  void init() {
    _list = mainList;
    notifyListeners();
    print("init list $_list");
  }
}
