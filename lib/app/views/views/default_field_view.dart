import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DefaultFieldView extends GetView {
  final String label;
  final String hint;
  final TextEditingController controller;
  const DefaultFieldView({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
