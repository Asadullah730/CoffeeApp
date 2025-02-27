import 'package:coffee_shop/Presentation/home_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EndingPage extends StatefulWidget {
  const EndingPage({super.key});

  @override
  _EndingPageState createState() => _EndingPageState();
}

class _EndingPageState extends State<EndingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset(
                "Assets/images/Order placed.png",
                fit: BoxFit.cover,
              ),
            ),
            // Lottie Animation
            Center(
              child: Lottie.asset(
                'Assets/lottie_animation/congratulations.json', // Path to your Lottie file
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the Lottie file
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Thank you!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 26),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'You have placed your ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      ),
                      Text(
                        ' Order Successfully',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 26),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: 'View More Options',
                  textColor: Color(0XFF8D510A),
                  height: 53,
                  width: 200,
                  fontsize: 18,
                  onPressed: () {
                    Get.back();
                    Get.to(() => HomeScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
