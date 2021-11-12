import 'package:flutter/material.dart';
import 'package:flutter_api_auth/data/repository/authentication_repository.dart';
import 'package:flutter_api_auth/presentation/widgets/custom_text_field.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController password2Controller = TextEditingController();

    AuthenticationRepository authRepo = AuthenticationRepository();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30),
          child: Wrap(
            runSpacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: CustomTextField("Firstname", firstnameController),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: CustomTextField("Lastname", lastnameController),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: CustomTextField("Email", emailController),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: CustomTextField(
                      "Password",
                      passwordController,
                      isPassword: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: CustomTextField(
                      "Password Again",
                      password2Controller,
                      isPassword: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: TextButton(
                      onPressed: () {
                        authRepo.signup(
                          firstName: firstnameController.text,
                          lastName: lastnameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          password2: password2Controller.text,
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(18.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.66,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      child: const Text(
                        'Already have an account? Sign in.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      style: TextButton.styleFrom(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
