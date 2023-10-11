import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "Каждый день тысячи девушек распаковывают пакеты с "
        "новинками Lichi и становятся счастливее, ведь очевидно, "
        "что новое платье может изменить день, а с ним и всю жизнь!",
        style: context.theme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
