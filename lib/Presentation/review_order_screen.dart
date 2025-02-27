import 'package:coffee_shop/common/card.dart';
import 'package:coffee_shop/common/custom_container_forreview.dart';
import 'package:flutter/material.dart';

class ReviewOrderScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final String? size;
  const ReviewOrderScreen({
    super.key,
    required this.product,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Review Order',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0XFFF6CB9B),
            size: 35,
          ),
        ),
        body: CustomContainerForReview(
          imgPath: product['imgPath'],
          size: size ?? 'S',
          price: product['price'],
        ),
      ),
    );
  }
}
