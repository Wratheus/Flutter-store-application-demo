import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/bucket/bucket_view.dart';
import 'package:lichi_test/feature/views/catalog/catalog_category_view.dart';
import 'package:lichi_test/feature/widgets/text_fields/search_text_field.dart';

import '../../../core/utils/ui/page_transition.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Поиск",
                  style: context.theme.textTheme.bodyLarge,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: SearchTextField(
                      hint: "Введите артикул или название модели"
                  ),
                ),
                Text("Lichi Members Club",
                  style: context.theme.textTheme.bodyMedium,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(context, SlideRightRoute(page: CatalogCategoryView())),
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Special Sale",
                      style: context.theme.textTheme.bodyMedium?.copyWith(color: context.theme.splashColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Одежда",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Аксессуары",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Обувь",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Inspire",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Stores",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 300), // TODO: fix height
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(context, SlideRightRoute(page: BucketView())),
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text("Корзина",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
