import 'package:flutter/material.dart';
import 'package:flutter_api_auth/data/repository/authentication_repository.dart';
import '../../widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    AuthenticationRepository authRepo = AuthenticationRepository();

    return Scaffold(
      body: Center(
        child: Wrap(
          runSpacing: 10,
          children: [
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
                  child: TextButton(
                    onPressed: () {
                      authRepo.login(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: const Text(
                      'Login',
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
                      Navigator.of(context).pushNamed("/signup");
                    },
                    child: const Text(
                      'Don’t have an account ? Sign up.',
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
    );
  }
}
