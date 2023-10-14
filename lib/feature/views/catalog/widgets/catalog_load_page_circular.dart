import 'package:flutter/material.dart';

class CatalogLoadPageCircular extends StatelessWidget {
  const CatalogLoadPageCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 5,
          ),
        ),
      ),
    );
  }
}
