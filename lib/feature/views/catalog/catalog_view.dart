import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/widgets/bucket_button.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_sale_card.dart';
import 'package:lichi_test/feature/widgets/buttons/custom_rectangle_button.dart';

import '../../../core/constants/style/themes.dart';
import '../../../core/utils/material_app_bloc/material_app_bloc.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Каталог товаров", style: context.theme.textTheme.bodyMedium),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: BucketCounterButton(),
          ),
        ],
      ),
      body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("Каждый день тысячи девушек распаковывают пакеты с "
                            "новинками Lichi и становятся счастливее, ведь очевидно, "
                            "что новое платье может изменить день, а с ним и всю жизнь!",
                          style: context.theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomRectangleButton(
                                onPressed: () => {
                                  context.read<MaterialAppBloc>().add(
                                      MaterialAppChangeThemeEvent(theme: DarkTheme.themeData)),
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.nights_stay,
                                      size: 40.0,
                                      color: context.theme.primaryColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Text("Темная тема", style: context.theme.textTheme.bodyMedium),
                                  ],
                                )
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: CustomRectangleButton(
                                onPressed: () => {
                                  context.read<MaterialAppBloc>().add(MaterialAppChangeThemeEvent(theme: LightTheme.themeData)),
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.sunny,
                                      size: 40.0,
                                      color: context.theme.primaryColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Text("Светлая тема", style: context.theme.textTheme.bodyMedium),
                                  ],
                                )
                            ),
                          )
                        ],
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
                );
              }),)
          ]
      ),
    );
  }
}
