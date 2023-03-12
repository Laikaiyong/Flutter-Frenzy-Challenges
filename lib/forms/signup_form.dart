import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/form/custom_form_text_field.dart';
import '../components/form/custom_form_submit_button.dart';

class RegisterForm extends StatefulWidget {
  TextEditingController usernameController;
  TextEditingController passwordController;
  RegisterForm(this.usernameController, this.passwordController, {super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

          const SizedBox(height: 35),

          CustomSubmitButton(() {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );

              Navigator.pushNamed(context, '/');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registered Successfully')),
              );
            }
          }, 'Register')
        ],
      ),
    );
  }
}
