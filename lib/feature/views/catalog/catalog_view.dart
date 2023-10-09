import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/text_fields/custom_text_field.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Поиск",
            style: context.theme.textTheme.bodyLarge,
          ),
          CustomTextField(
              hint: "Введите артикул или название модели"
          ),
          Text("Lichi Members Club",
            style: context.theme.textTheme.bodyMedium,
          ),
          Text("elem1",
            style: context.theme.textTheme.headlineMedium,
          ),
          ListView(
            children: [
              Text("elem1",
                style: context.theme.textTheme.bodyMedium,
              ),
              Text("elem2",
                style: context.theme.textTheme.bodyMedium,
              ),
              Text("elem3",
                style: context.theme.textTheme.bodyMedium,
              ),
              Text("elem4",
                style: context.theme.textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
