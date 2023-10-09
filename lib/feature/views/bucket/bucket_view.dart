import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/buttons/custom_elevated_button.dart';

class BucketView extends StatelessWidget {
  const BucketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 120,
        title: Text("Корзина",
          style: context.theme.textTheme.displayMedium,
        ),
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [

            ],
          ),
          Row(
            children: [
              Text("Стоимость товара(-ов):",
                style: context.theme.textTheme.displayMedium,
              ),
              Text("99999999 ₽",
                style: context.theme.textTheme.bodyMedium,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElevatedButton(
                onPressed: () => {},
                child: Text(
                  "ПЕРЕЙТИ К ОФОРМЛЕНИЮ",
                  style: context.theme.textTheme.bodyMedium,
                )
            ),
          )
        ],
      )
    );
  }
}
