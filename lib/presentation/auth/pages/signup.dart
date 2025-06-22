import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_parms.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 60),
            _signinButton(),
            SizedBox(height: 10),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUseCase>().call(
          params: SignupReqParms(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: ' Sign In',
            style: TextStyle(color: Colors.blueAccent),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SigninPage());
                  },
          ),
        ],
      ),
    );
  }
}
