import 'package:ecomapp/views/widgets/button_widget.dart';
import 'package:ecomapp/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                'Register Account',
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
                      hintText: 'John Doe',
                      text: 'Name',
                    ),
                    SizedBox(height: 14),
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
                    ButtonWidget(text: 'Sign Up', onPressed: () {}),
                  ],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                child: Text(
                  'Already have an account, Login',
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
