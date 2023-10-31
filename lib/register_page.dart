import 'package:chat/Component/mu_button.dart';
import 'package:chat/Component/my_text_field.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({required this.onTap, super.key});
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password doesn't match")));
      return;
    }

    //get Auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 80,
              color: Colors.grey[800],
            ),
            SizedBox(
              height: 10,
            ),
            //Text
            Text(
              "Create Account",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            //Email Textfield
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obsureText: false),
            SizedBox(
              height: 10,
            ),
            //Password
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsureText: true),
            SizedBox(
              height: 10,
            ),
            //Password
            MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsureText: true),
            SizedBox(
              height: 10,
            ),
            //
            MyButton(onTap: signUp, text: 'Sign Up')
            //
            ,
            SizedBox(
              height: 10,
            ),
            GestureDetector(onTap: widget.onTap, child: Text('Login now'))
          ],
        ),
      ),
    );
  }
}
