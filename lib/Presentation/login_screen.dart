import 'package:coffee_shop/Presentation/home_screen.dart';
import 'package:coffee_shop/Presentation/signup_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/textField.dart';
import 'package:coffee_shop/validation/login_validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController user_name_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "Assets/images/background_image.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          /// Foreground Content
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image:
                        AssetImage("Assets/images/game-icons_coffee-beans.png"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  CustomTextField(
                    controller: user_name_controller,
                    hint: 'UserName',
                    opacity: 0.8,
                    validator: (value) =>
                        LoginValidation().userNameValidation(value!),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: password_controller,
                    hint: 'Password',
                    opacity: 0.8,
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'password must be Atleast 6 characters';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.13),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    title: 'Login',
                    opacity: 0.8,
                    textColor: Colors.black,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                            "Authentication Message",
                            'Login Successfuly',
                            backgroundColor: Color(0XFF673AB7FF),
                        );
                        Get.to(() => HomeScreen()); // Navigate if valid
                      } else {
                        if (kDebugMode) {
                          print("Fill the form first");
                        }
                      }
                    },
                  ),

                  /// Sign Up Option
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have an Account? ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      TextButton(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          Get.to(() => SignUpScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
