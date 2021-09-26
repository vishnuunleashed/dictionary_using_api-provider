import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/diction_view_page.dart';
import 'package:project/dictionary_notifier.dart';
import 'package:project/dictionarymain.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ChangeNotifierProvider(
              child: DictionViewPage(),
              create: (BuildContext context) =>
                  DictionaryNotifier(),

      ),
    );
  }
}
