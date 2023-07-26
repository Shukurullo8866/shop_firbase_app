// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(231, 245, 179, 104), // Background color
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
