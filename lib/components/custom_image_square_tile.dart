import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  const SquareTile({super.key, this.imagePath = "", this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: (imagePath != null && imagePath != "")
          ? Image.asset(
              imagePath!,
              height: 35,
            )
          : Icon(
              icon!,
              size: 35,
            ),
    );
  }
}
