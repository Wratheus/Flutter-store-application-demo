import 'package:flutter/material.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LichiTest',
      theme: ThemeData.light(),
      home: const CatalogView()
    );
  }
}
