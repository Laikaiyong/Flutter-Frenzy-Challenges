import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/form/custom_form_text_field.dart';
import '../components/form/custom_form_submit_button.dart';

class LoginForm extends StatefulWidget {
  TextEditingController usernameController;
  TextEditingController passwordController;
  LoginForm(this.usernameController, this.passwordController, {super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // username textfield
          CustomFormTextField(
              controller: widget.usernameController,
              hintText: 'Enter Username',
              labelText: 'Username',
              obscureText: false,
              inputIcon: Icons.person),

          const SizedBox(height: 10),

          // password textfield
          CustomFormTextField(
              controller: widget.passwordController,
              hintText: 'Enter Password',
              labelText: 'Password',
              obscureText: true,
              inputIcon: Icons.lock),

          const SizedBox(height: 10),

          // forgot password?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          CustomSubmitButton(() {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          }, 'Login')
        ],
      ),
    );
  }
}
