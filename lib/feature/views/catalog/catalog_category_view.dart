import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_sale_card.dart';

class CatalogCategoryView extends StatelessWidget {
  const CatalogCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_rounded),
          centerTitle: true,
          title: Text(
      "category_name",
            style: context.theme.textTheme.bodyMedium
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "ВСЕ"),
              Tab(text: "subCategory1"),
              Tab(text: "subCategory2"),
              Tab(text: "subCategory3"),
              Tab(text: "subCategory4"),
              Tab(text: "subCategory5"),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemBuilder: (BuildContext context, int index) {
                return CatalogSaleCard();
              },
            )
          ],
        ),
      ),
    );
  }
}
