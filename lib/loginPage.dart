import 'package:chat/Component/mu_button.dart';
import 'package:chat/Component/my_text_field.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.onTap, super.key});
  final void Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn() async {
    //get the auth service
    final _authService = Provider.of<AuthService>(context, listen: false);
    try {
      await _authService.signInWithEmailAndPassword(
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
              "Welcome Back",
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
            //
            MyButton(onTap: signIn, text: 'Sign in')
            //
            ,
            SizedBox(
              height: 10,
            ),
            GestureDetector(onTap: widget.onTap, child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
