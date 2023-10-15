import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/buttons/cart_button/cart_button.dart';
import '../../../widgets/buttons/closure_button.dart';
import '../../../widgets/carousel_controller/bloc/carousel_bloc.dart';
import '../../../widgets/carousel_controller/carousel_controller.dart';
import '../../catalog/utils/catalog_functions.dart';
import '../models/product.dart';

class ProductHeader extends StatelessWidget {
  final Product product;

  const ProductHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        BlocProvider(
          create: (context) =>
              CarouselBloc()..add(CarouselSelectedEvent(selectedIndex: 0)),
          child: BlocBuilder<CarouselBloc, CarouselState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                      items: CatalogFunctions.getCatalogCardImages(
                          product: product, isBig: true),
                      options: CarouselOptions(
                        onPageChanged: (index, event) => context
                            .read<CarouselBloc>()
                            .add(CarouselSelectedEvent(selectedIndex: index)),
                        viewportFraction: 1,
                        height: 550,
                        enableInfiniteScroll: true,
                        autoPlay: false,
                        scrollDirection: Axis.horizontal,
                      )),
                  if (state is CarouselLoadedState)
                    Positioned(
                      bottom: 35,
                      child: CarouselControllerWidget(
                          images: product.photos,
                          selectedIndex: state.selectedIndex),
                    )
                ],
              );
            },
          ),
        ),
        const Positioned(
          left: 0,
          top: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: CartCounterButton(reverseRow: true),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: ClosureButton(onPressed: () {
              Navigator.of(context).pop();
            }),
          ),
        ),
        // Positioned(
        //   bottom: 10,
        //   child: Text(
        //     "D E S I G N E D  I N  G E R M A N Y",
        //     style: context.theme.textTheme.bodyMedium,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ],
    );
  }
}
