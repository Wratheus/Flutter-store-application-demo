import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/utils/catalog_functions.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/widgets/product_color_circle.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/bloc/carousel_bloc.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../../widgets/carousel_controller/carousel_controller.dart';
import '../../product/product_view.dart';

class CatalogProductCard extends StatelessWidget {
  final Product product;
  final BuildContext parentContext;

  const CatalogProductCard(
      {super.key, required this.product, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => {
        Navigator.of(parentContext)
            .push(SlideRightRoute(page: ProductView(product: product)))
      },
      child: Column(
        children: [
          BlocProvider(
            create: (context) =>
                CarouselBloc()..add(CarouselSelectedEvent(selectedIndex: 0)),
            child: BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      CarouselSlider(
                          items: CatalogFunctions.getCatalogCardImages(
                              product: product),
                          options: CarouselOptions(
                            onPageChanged: (index, event) => context
                                .read<CarouselBloc>()
                                .add(CarouselSelectedEvent(
                                    selectedIndex: index + 1)),
                            viewportFraction: 1,
                            height: 276,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                            scrollDirection: Axis.horizontal,
                          )),
                      if (state is CarouselLoadedState)
                        Positioned(
                          bottom: 15,
                          left: 15,
                          child: CarouselControllerWidget(
                              images: product.photos,
                              selectedIndex: state.selectedIndex),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "${product.price} руб.",
              textAlign: TextAlign.center,
              style: parentContext.theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            product.name,
            style: parentContext.theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ProductColorCircle(
                size: const Size(10, 10),
                colorStr: product.colors.colorValue,
              ),
              for (String element in product.colors.otherColors)
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: ProductColorCircle(
                    size: const Size(10, 10),
                    colorStr: element,
                  ),
                )
            ]),
          )
        ],
      ),
    );
  }
}
