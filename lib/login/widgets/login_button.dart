import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const LoginButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 45,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          )),
    );
  }
}
