// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SingnInButton extends StatelessWidget {
  SingnInButton({super.key, required this.onTap, required this.text});
  String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onLongTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 18, right: 18),
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(231, 239, 156, 61),
              Color.fromARGB(231, 229, 193, 152),
            ],
          ),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.2),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
