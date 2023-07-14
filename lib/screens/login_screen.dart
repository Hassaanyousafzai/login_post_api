// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_post_api/screens/home_page.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var data = [];
  void login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Failed'),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 210,
              right: 20,
              child: Image(
                image: AssetImage('assets/images/Union1.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 20.0),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Enter your username and password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff565656)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldWidget(controller: emailController, text: 'Email'),
                TextFieldWidget(
                    controller: passwordController, text: 'Password'),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    login(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Center(
                    child: Container(
                      width: 229,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Forgotten Password?',
                    style: TextStyle(fontSize: 15, color: Color(0xff6B6B6B)),
                  ),
                ),
                const Center(
                  child: Text(
                    'Or create a New Account',
                    style: TextStyle(fontSize: 15, color: Color(0xff6B6B6B)),
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
