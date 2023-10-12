import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/app_ui_modals.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/product/bloc/product_bloc.dart';
import 'package:lichi_test/feature/views/product/utils/product_functions.dart';
import 'package:lichi_test/feature/views/product/widgets/product_color_circle.dart';
import 'package:lichi_test/feature/views/product/widgets/product_sliver_appbar.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';
import 'package:lichi_test/feature/views/product/widgets/product_add_dialog.dart';

import '../../../core/constants/style/colors.dart';
import '../../app/app.dart';
import '../../widgets/buttons/cart_button/cart_button.dart';
import '../../widgets/buttons/closure_button.dart';
import '../catalog/bloc/catalog_bloc.dart';
import '../catalog/utils/catalog_functions.dart';
import 'models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({super.key, required this.product});
 // TODO цвета не показываются
  @override
  Widget build(BuildContext context) {
    final List<Widget> circleColors = [
    ProductColorCircle(
      size: const Size(18, 18),
      colorStr: product.colors.colorValue,
      )
    ];
    for (String element in product.colors.otherColors) {
      circleColors.add(ProductColorCircle(
        size: const Size(18, 18),
            colorStr: element,
      ));}
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(ProductLoadEvent()),
        )
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
          SliverAppBar(
          expandedHeight: 500,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                        items: ProductFunctions.getProductCardImages(product: product, context: context),
                        options: CarouselOptions(
                          height: context.mq.size.height,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          autoPlay: false,
                          scrollDirection: Axis.horizontal,
                        )
                    ),
                    const Positioned(
                      left: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 5.0),
                        child: CartCounterButton(reverseRow: true),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                        child: ClosureButton(onPressed: () {
                          Navigator.of(context).pop();
                        }),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        "D E S I G N E D  I N  G E R M A N Y",
                        style: context.theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
        ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: circleColors
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:20),
                          child: Text(
                            product.colors.colorName,
                            style: context.theme.textTheme.bodySmall,
                          ),
                        ),
                        Text(
                          "${product.price} руб.",
                          style: context.theme.textTheme.bodyLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: RectangleButton(
                              onPressed: () {
                                context.read<ProductBloc>().add(ProductAddToCartEvent(context: context, product: product));
                              },
                              child: Text("Добавить в корзину", style: context.theme.textTheme.bodyMedium)
                          ),
                        ),
                        Text(
                          product.descriptions,
                          style: context.theme.textTheme.bodyMedium,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      );
  },
),
    );
  }
}
