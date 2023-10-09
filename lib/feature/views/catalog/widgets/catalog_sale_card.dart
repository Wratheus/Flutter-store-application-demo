import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CatalogSaleCard extends StatelessWidget {
  const CatalogSaleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 100,
          ),
          const SizedBox(height: 20),
          Text("Рубашка в тонкую полоску",
            style: context.theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Text("4 299 руб.",
            style: context.theme.textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 3.5,
            ),
          )
        ],
      ),
    );
  }
}
