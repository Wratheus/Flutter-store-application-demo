import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/buttons/cart_button.dart';
import 'package:lichi_test/feature/widgets/buttons/closure_button.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 450,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.bottomCenter,
                children: [
                  const FlutterLogo(),
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
                      Container(
                        width: 15,
                        height: 3,
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "EXAMPLE TEXT SALE NAME",
                          style: context.theme.textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        "999 руб",
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      Text(
                        "color parameter",
                        style: context.theme.textTheme.bodySmall,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: CircleAvatar(
                          /// sale color
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Text(
                        "Укороченный кардиган прилегающего силуэта с треугольным отложным воротником и имитацией нагрудных карманов, "
                        "а также асимметричным нижним краем и застежкой на крупные металлизированные пуговицы. Модель выполнена из вязаного трикотажа и образует комплект "
                        "с соответствующей юбкой мини. укороченная модель прямой крой отложной воротник нагрудные карманы длинные рукава асимметричный нижний край застежка на "
                        "пуговицы манжеты, листочки карманов и нижний край в рубчик",
                        style: context.theme.textTheme.bodyMedium,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "ART \$апртикул",
                        style: context.theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "ЕСТЬ ВОПРОС? СВЯЖИТЕСЬ С НАМИ\nПН-ПТ 10:00- 19:00 (мск)",
                        style: context.theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      )
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
  }
}
