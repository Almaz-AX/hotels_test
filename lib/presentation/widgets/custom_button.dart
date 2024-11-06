import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap, required this.title,
    
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(16))),
      child: Text(title,
          style: const TextStyle(color: Colors.white)),
    );
  }
}
