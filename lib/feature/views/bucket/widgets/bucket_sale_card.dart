import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class BucketSaleCard extends StatelessWidget {
  const BucketSaleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Column(
          children: [
            FlutterLogo(
              size: 100,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Рубашка в тонкую полоску",
                style: context.theme.textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("4 599 руб.",
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text("Черный", style: context.theme.textTheme.bodySmall),
                        ],
                      ),
                      Text("Размер \"L\"", style: context.theme.textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(width: 100), // TODO: fix
                  Row(
                    children: [
                      Text("Кол-во: 1 ^", style: context.theme.textTheme.bodySmall),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
