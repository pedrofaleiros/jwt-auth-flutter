import 'package:authentication/src/home/model/item_model.dart';
import 'package:authentication/src/home/view/components/item.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({
    super.key,
    required this.items,
  });

  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items
          .map(
            (item) => Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Item(item: item),
            ),
          )
          .toList(),
    );
  }
}
