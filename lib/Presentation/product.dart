import 'package:coffee_shop/Presentation/review_order_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/custom_select_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  var selectedSize = 'S'.obs; // Single variable to track size selection

  ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 450,
                child: Image.asset(
                  product['imgPath'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['title'].toString(),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0XFF8D510A),
                              size: 18,
                            ),
                            Text(
                              product['rating'].toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['subtitle'].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Rs-${product['price'].toString()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /// **Size Selection**
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Small Size Button
                      GestureDetector(
                        onTap: () {
                          selectedSize.value = 'S';
                        },
                        child: CustomSelectButton(
                          text: 'S',
                          isSelected: selectedSize.value == 'S',
                        ),
                      ),

                      /// Medium Size Button
                      GestureDetector(
                        onTap: () {
                          selectedSize.value = 'M';
                          if (kDebugMode) {
                            print(
                                "SLECTED SIZE OF COFFEE ${selectedSize.value}");
                          }
                        },
                        child: CustomSelectButton(
                          text: 'M',
                          isSelected: selectedSize.value == 'M',
                        ),
                      ),

                      /// Large Size Button
                      GestureDetector(
                        onTap: () {
                          selectedSize.value = 'L';
                        },
                        child: CustomSelectButton(
                          text: 'L',
                          isSelected: selectedSize.value == 'L',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// **Place Order Button**
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 83,
                    color: Color(0XFFEEE5DB),
                    child: Center(
                      child: CustomButton(
                        onPressed: () {
                          Get.to(() => ReviewOrderScreen(
                                product: product,
                                size: selectedSize.value,
                              ));
                        },
                        title: 'Place Order',
                        width: 200,
                        height: 50,
                        color: Color(0XFF8D510A),
                        textColor: Colors.white,
                        // opacity: 0.10,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// **Transparent AppBar**
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: true,
              iconTheme:
                  const IconThemeData(color: Color(0XFFF6CB9B), size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
