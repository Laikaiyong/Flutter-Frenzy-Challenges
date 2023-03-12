import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  Function()? onpressTrigger;
  String buttonLabel;

  CustomSubmitButton(this.onpressTrigger, this.buttonLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
          onPressed: onpressTrigger,
          child: Text(buttonLabel),
        ));
  }
}
