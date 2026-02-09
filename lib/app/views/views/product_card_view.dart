import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/functions/functions.dart';
import 'package:point_of_sales/app/data/models/product_model.dart';

class ProductCardView extends GetView {
  final ProductModel product;
  const ProductCardView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final priceFormatter = PriceFormatter();
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.image, size: 50)),
          ),
          SizedBox(height: 5),
          Text(
            product.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            product.category.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  priceFormatter.format(product.price),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
