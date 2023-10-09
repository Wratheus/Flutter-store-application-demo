import 'package:flutter/material.dart';
import 'package:lichi_test/feature/views/catalog/catalog_category_view.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';
import 'package:lichi_test/feature/views/sale_view/sale_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LichiTest',
      theme: ThemeData.light(),
      home: CatalogView()
    );
  }
}
