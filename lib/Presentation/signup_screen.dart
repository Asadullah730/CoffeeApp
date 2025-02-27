import 'package:coffee_shop/Presentation/login_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/textField.dart';
import 'package:coffee_shop/validation/login_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController user_name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

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
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image:
                        AssetImage("Assets/images/game-icons_coffee-beans.png"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  CustomTextField(
                    hint: 'UserName',
                    opacity: 0.75,
                    controller: user_name_controller,
                    validator: (value) =>
                        LoginValidation().userNameValidation(value!),
                  ),
                  CustomTextField(
                    controller: email_controller,
                    hint: 'Email',
                    opacity: 0.75,
                    validator: (value) =>
                        LoginValidation().emailValidation(value!),
                  ),
                  CustomTextField(
                    controller: password_controller,
                    hint: 'Password',
                    opacity: 0.75,
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'password must be Atleast 6 characters';
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  CustomButton(
                    title: 'Sign Up',
                    textColor: Colors.black,
                    color: Colors.white,
                    opacity: 0.75,
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        Get.snackbar(
                            "Authentication Message",
                            'You Register Successfully',
                            backgroundColor: Color(0XFF673AB7FF));
                        Get.to(() => LoginScreen());
                      }

                    },
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
