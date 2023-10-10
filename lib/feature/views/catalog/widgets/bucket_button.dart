import 'package:flutter/material.dart';
import 'package:lichi_test/core/constants/style/themes.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/bucket/bucket_view.dart';

import '../../../../core/utils/ui/page_transition.dart';

class BucketCounterButton extends StatelessWidget {
  final bool disableBackground;
  final bool reverseRow;
  const BucketCounterButton({Key? key, this.disableBackground = false, this.reverseRow = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Icon shopBag = Icon(Icons.shopping_bag, size: 15, color: context.theme.primaryColor);
    Text counter = Text("\$0", style: context.theme.textTheme.bodyMedium);
    return GestureDetector(
        onTap: () => {
          Navigator.pushReplacement(context, SlideRightRoute(page: const BucketView()))
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: disableBackground ? Colors.transparent : context.theme.canvasColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: reverseRow ?
              Row(
                  children:
                  [
                    shopBag,
                    const SizedBox(width: 5),
                    counter
                  ]
              )
                :
              Row(
                  children:
                  [
                    counter,
                    const SizedBox(width: 5),
                    shopBag,
                  ]
              )
            )
        )
    );
  }
}
