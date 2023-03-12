import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/form/custom_form_text_field.dart';
import '../components/form/custom_form_submit_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  TextEditingController usernameController;
  ForgotPasswordForm(this.usernameController, {super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
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
              obscureText: false),

          const SizedBox(height: 35),

          CustomSubmitButton(() {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Verification code sent')),
              );
            }
          }, 'Reset Password')
        ],
      ),
    );
  }
}
