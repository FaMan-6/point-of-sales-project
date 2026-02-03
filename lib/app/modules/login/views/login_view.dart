import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:point_of_sales/app/data/widgets/widgets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Point of Sales',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Text(
                    'Project created for As1',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 600,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Login Your Store',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        DefaulImportanttField(
                          label: 'Store Name',
                          hint: 'Enter your store name',
                          controller: controller.storeNameController,
                        ),
                        SizedBox(height: 20),
                        DefaultPasswordField(
                          label: 'Password',
                          hint: 'Enter your password',
                          controller: controller.passwordController,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.forgotPassword();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DefaultButton(
                    text: 'Login',
                    onPress: () async {
                      await controller.login();
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
