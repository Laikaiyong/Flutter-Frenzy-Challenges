import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../components/custom_button.dart';
import '../components/custom_image_square_tile.dart';
import '../components/form/custom_text_field.dart';
import '../forms/forgot_password_form.dart';
import '../forms/login_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        body: Stack(children: <Widget>[
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  // App Logo
                  const Icon(
                    Icons.lock_reset,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // App title
                  Text("Flutter Frenzy\nBootcamp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ForgotPasswordForm(usernameController),
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text(''), // You can add title here
              // ignore: unnecessary_new
              leading: new IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.blue.withOpacity(0),
              elevation: 0.0,
            ),
          ),
        ]));
  }
}
