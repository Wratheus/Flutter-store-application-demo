import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/bucket/widgets/bucket_sale_card.dart';
import 'package:lichi_test/feature/widgets/buttons/custom_rectangle_button.dart';

class BucketView extends StatelessWidget {
  const BucketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина",
          style: context.theme.textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              BucketSaleCard(),
              BucketSaleCard(),
              BucketSaleCard(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Стоимость товара(-ов):\t",
                  style: context.theme.textTheme.bodyMedium,
                ),
                Text("9999 руб.",
                  style: context.theme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomRectangleButton(
                onPressed: () => {

                },
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
