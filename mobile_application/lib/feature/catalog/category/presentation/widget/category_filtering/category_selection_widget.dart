import 'package:flutter/material.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/common/_common.dart';

/// [Stateless] Category Filtering Button Widget
///
/// - @param [Category category] : to set category inherited
/// - @param [Function(category)] : to controll onTap mechanism
/// - @param [Bool isSelected] : to react selected category
class CategorySelectionWidget extends StatelessWidget {
  final Category category;
  final ValueSetter<Category> onTap;
  final bool Function(Category category) isSelected;
  const CategorySelectionWidget({
    super.key,
    required this.category,
    required this.onTap,
    required this.isSelected,
  });

  double get selectedOpacity {
    return isSelected.call(category) ? 1.0 : 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category),
      child: Container(
        decoration: isSelected(category)
            ? const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white)))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  category.name.capitializeEachWord(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.withOpacity(selectedOpacity),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
