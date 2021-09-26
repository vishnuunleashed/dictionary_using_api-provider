import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:project/dictionarymain.dart';
import 'package:http/http.dart' as http;

class DictionaryNotifier extends ChangeNotifier{

  DictionaryMain dictionaryMain;
  var url;


  DictionaryNotifier();

  void fetchData(var value) async {

    url = Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$value');


    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);

        dictionaryMain = DictionaryMain.fromJson(jsonMap[0]);

        notifyListeners();

        print("Success!!");
      } else {
        print("Request failed");
      }
    } catch (Exception) {
      print("Exception");
    }

  }

}