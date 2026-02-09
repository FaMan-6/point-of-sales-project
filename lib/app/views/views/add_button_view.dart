import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddButtonView extends GetView {
  final Function() onTap1;
  final Function() onTap2;
  const AddButtonView({super.key, required this.onTap1, required this.onTap2});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 1) {
          onTap1();
        } else if (value == 2) {
          onTap2();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 1, child: Text('Category')),
        PopupMenuItem(value: 2, child: Text('Product')),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text(
          'Add',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
