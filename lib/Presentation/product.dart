import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/custom_select_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image covering the background
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
                          product['price'].toString(),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Color(0XFF8D510A),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("ADD Button Clicked");
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomSelectButton(
                      text: 'S',
                    ),
                    CustomSelectButton(
                      text: 'M',
                    ),
                    CustomSelectButton(
                      text: 'L',
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
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
                child: Container(
                  color: Color(0XFFEEE5DB),
                  child: Center(
                    child: CustomButton(
                      onPressed: () {},
                      title: 'Place Order',
                      width: 200,
                      height: 50,
                      color: Color(0XFF8D510A),
                      textColor: Colors.white,
                      // opacity: 0.10,
                    ),
                  ),
                ),
              )
            ],
          ),

          // AppBar with transparent background
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Color(0XFFF6CB9B), size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
