import 'package:ecomapp/views/auth/register_view.dart';
import 'package:ecomapp/views/home/home_view.dart';
import 'package:ecomapp/views/widgets/button_widget.dart';
import 'package:ecomapp/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Hello Again!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Fill your details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: TextEditingController(),
                      hintText: 'xyz@gmail.com',
                      text: 'Email Address',
                    ),
                    SizedBox(height: 14),
                    TextFieldWidget(
                      controller: TextEditingController(),
                      hintText: '*********',
                      text: 'Password',
                      isPassword: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          print('Clicked');
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Recover password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    ButtonWidget(
                      text: 'Sign In',
                      onPressed: () {
                        Get.to(() => const HomeView());
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => const RegisterView());
                },
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: Text(
                  'New user, Register',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
