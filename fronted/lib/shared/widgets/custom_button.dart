// # Botón reutilizable
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color.fromARGB(255, 92, 211, 81),
    this.textStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      icon: icon ?? const SizedBox.shrink(),
      label: Text(
        text,
        style: textStyle ?? const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
