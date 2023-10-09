import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/bucket/widgets/bucket_sale_card.dart';
import 'package:lichi_test/feature/widgets/buttons/custom_elevated_button.dart';

import '../../../core/utils/ui/page_transition.dart';
import '../catalog/catalog_view.dart';

class BucketView extends StatelessWidget {
  const BucketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.canvasColor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(context, SlideRightRoute(page: const CatalogView())),
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: context.theme.primaryColor,
            )
        ),
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
                Text("9999 ₽",
                  style: context.theme.textTheme.bodyMedium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
