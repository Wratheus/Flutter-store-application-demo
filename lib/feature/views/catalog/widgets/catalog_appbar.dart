import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../widgets/buttons/cart_button/cart_button.dart';

class CatalogAppBar extends AppBar implements PreferredSizeWidget {
  CatalogAppBar({super.key});

  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Каталог товаров", style: context.theme.textTheme.bodyMedium),
      actions: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: CartCounterButton(),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}