import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddImageView extends GetView {
  final Function() callBack;
  const AddImageView({super.key, required this.callBack});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Icon(Icons.image, size: 50)),
      ),
    );
  }
}
