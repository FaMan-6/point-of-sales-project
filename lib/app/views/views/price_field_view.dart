import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PriceFieldView extends GetView {
  final TextEditingController controller;
  final String label;
  final String hint;
  const PriceFieldView({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: label,
        hintText: hint,
      ),
      keyboardType: TextInputType.number,
      validator: (value) => value!.isEmpty ? 'Price is required' : null,
    );
  }
}
