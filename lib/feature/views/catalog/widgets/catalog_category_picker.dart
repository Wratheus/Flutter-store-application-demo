import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/constants/style/text_styles.dart';
import '../bloc/catalog_bloc.dart';

class CatalogCategoryPicker extends StatelessWidget {
  final String category;
  final Map<String, String> categories = {"new": "Новинки", "dresses": "Платья", "skirts": "Юбки", "shoes": "Обувь"};

  CatalogCategoryPicker({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showMaterialModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) {
              return Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Выберите категорию",
                              style: context.theme.textTheme.bodyMedium)),
                      for(MapEntry entry in categories.entries)
                        if (entry.key == "new")
                          GestureDetector(
                                      onTap: () => _changeCategory(context, _, entry.key),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(entry.value,
                                            style: CustomTextStyles.redTextColor),
                                      ))
                         else
                          GestureDetector(
                                    onTap: () => _changeCategory(context, _, entry.key),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(entry.value,
                                          style: context.theme.textTheme.bodyMedium),
                                    ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(categories[category]!,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyMedium),
          ],
        ));
  }

  _changeCategory(BuildContext context, BuildContext modalContext, String category) {
    Navigator.pop(modalContext);
    context.read<CatalogBloc>().add(CatalogLoadEvent(catalogCategory: category));
  }
}
