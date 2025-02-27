import 'package:coffee_shop/Presentation/payment_page.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerForReview extends StatelessWidget {
  final String imgPath;
  final String? size;
  var qty = 1.obs;
  int price;
  late var total;
  var sum;
  CustomContainerForReview({
    super.key,
    required this.imgPath,
    required this.price,
    this.size,
  }) {
    total = price.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          width: 329, // Adjust width as needed
          height: 129, // Adjust height as needed
          decoration: BoxDecoration(
            color: Color(0xFFEEE5DA), // Background color
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Row(
            children: [
              /// Image on the left with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imgPath, // Replace with your image path
                  width: 100, // Adjust image width
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12), // Space between image and text

              /// Details Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Cappuccino",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "With Oat Milk",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0XFF8D510A), size: 18),
                        const SizedBox(width: 5),
                        const Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Obx(
                          () {
                            return Text(
                              "Rs-${total.toString()}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Size: ${(size) ?? 'S'}",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFF8D510A),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            iconSize: 10,
                            onPressed: () {
                              if (qty > 1) {
                                qty--;
                                total.value -= price;
                                print('VALUE OF QTY : $qty');
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Obx(
                          () {
                            return Text(
                              '$qty',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFF8D510A),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            iconSize: 10,
                            onPressed: () {
                              qty++;
                              total.value += price;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 30, left: 30, right: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Total :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Obx(
                () => Text(
                  ' Rs-${total.value.toString()}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 40, left: 30, right: 30),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Shipping Charges :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                ' Rs-0',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 40, left: 30, right: 30),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Address:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  'Dera Ghazi khan',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        // Divider(),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xFFEEE5DA),
              height: 83,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Obx(
                          () => Text(
                            ' Rs-${total.value.toString()}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      title: 'Place Order',
                      onPressed: () {
                        Get.to(() => PaymentPage(
                              total: total.value,
                            ));
                      },
                      color: Color(0XFF8D510A),
                      textColor: Colors.white,
                      width: 200,
                      height: 53,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
