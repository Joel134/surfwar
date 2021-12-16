import 'package:flutter/material.dart';
import 'package:scapple_notes_app/pages/home_page/home_page.dart';
import 'package:scapple_notes_app/pages/scapple_page/scapple_page.dart';
import 'package:scapple_notes_app/service/hive.dart';

void main() async {
  await HiveInstance.initialiseHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scapple App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
