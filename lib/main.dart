import 'package:flutter/material.dart';
import 'package:mohammed_alharazi/controller/controller.dart';
import 'package:mohammed_alharazi/view/view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController()..loadData(),
      child: MaterialApp(
        title: 'Flutter Product App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductView(),
      ),
    );
  }
}
