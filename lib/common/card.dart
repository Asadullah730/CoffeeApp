import 'package:coffee_shop/Presentation/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key});
  var card = [
    {
      'imgPath': 'Assets/images/Rectangle 3.png',
      'title': 'Cupposino',
      'subtitle': 'without milk',
      'rating': '4.5',
      'price': '\$3.80',
    },
    {
      'imgPath': 'Assets/images/Rectangle 3 (1).png',
      'title': 'Cupposino',
      'subtitle': 'with milk',
      'rating': '4.5',
      'price': '\$3.00',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 10,
          mainAxisExtent: 202,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductScreen(product: card[index]));
              if (kDebugMode) {
                print("Pressed On the Coffee");
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color(0XFFEEE5DB),
                child: Column(
                  children: [
                    Image.asset(
                      card[index]['imgPath']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                card[index]['title'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0XFF8D510A),
                                    size: 14,
                                  ),
                                  Text(
                                    card[index]['rating'].toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                card[index]['subtitle'].toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                card[index]['price'].toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
