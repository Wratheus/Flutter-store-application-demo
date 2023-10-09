import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_sale_card.dart';

import '../../../core/utils/ui/page_transition.dart';

class CatalogCategoryView extends StatelessWidget {
  const CatalogCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.canvasColor,
        leading: GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(context, SlideRightRoute(page: const CatalogView())),
            },
            child: Icon(
                Icons.arrow_back_ios_rounded,
              color: context.theme.primaryColor,
            )
        ),
        centerTitle: true,
        title: Text(
        "category_name",
          style: context.theme.textTheme.bodyMedium
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Category2",
                        style: context.theme.textTheme.bodyMedium
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Category3",
                          style: context.theme.textTheme.bodyMedium
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Category4",
                          style: context.theme.textTheme.bodyMedium
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Category5",
                          style: context.theme.textTheme.bodyMedium
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Category6",
                          style: context.theme.textTheme.bodyMedium
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CatalogSaleCard(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
