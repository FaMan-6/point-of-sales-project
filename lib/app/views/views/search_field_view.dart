import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchFieldView extends GetView {
  final TextEditingController? controller;
  final String hintText;
  const SearchFieldView({super.key, this.controller, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
