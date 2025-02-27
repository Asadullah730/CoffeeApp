// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:coffee_shop/Presentation/ending_page.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/controller/PaymentMethodController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentPage extends StatelessWidget {
  var total;

  PaymentPage({super.key, required this.total});
  final PaymentMethodController controller = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment Method',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0XFFF6CB9B),
          size: 35,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Radio Button with Title
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Obx(
                      () {
                        return Row(
                          children: [
                            Radio<String>(
                              value: 'debit_credit',
                              groupValue:
                                  controller.selectedPaymentMethod.value,
                              onChanged: (String? value) {
                                if (value != null) {
                                  controller.selectPaymentMethod(value);
                                }
                              },
                              activeColor: Colors.brown,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Pay with Debit/Credit Card",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                /// Conditionally show text fields
                Obx(() {
                  if (controller.selectedPaymentMethod.value ==
                      'debit_credit') {
                    return Column(
                      children: [
                        /// Card Number Field
                        _buildTextField(
                            "Card Number", "XXXX  XXXX  XXXX  XXXX"),

                        const SizedBox(height: 20),

                        /// Expiry & CVV Fields
                        Row(
                          children: [
                            Expanded(child: _buildTextField("Exp", "MM/YY")),
                            Spacer(),
                            Expanded(child: _buildTextField("CVV", "XXX")),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// Name on Card Field
                        _buildTextField("Name on the Card", "XXXXXXXXXX"),
                      ],
                    );
                  } else {
                    return Container(); // Return an empty container if not selected
                  }
                }),

                const SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 83,
                color: Color(0XFFF6CB9B),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Amount',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ' Rs-${total.toString()}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        title: 'Pay Now',
                        onPressed: () {
                          Get.to(() => EndingPage());
                        },
                        color: Color(0XFF8D510A),
                        textColor: Colors.white,
                        width: 216,
                        height: 53,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Custom TextField Widget
  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        // const SizedBox(height: 35),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
