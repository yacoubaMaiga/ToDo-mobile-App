import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  String buttonText;
  Function buttonOnPressed;

  SaveButton({
    super.key,
    required this.buttonText,
    required this.buttonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Color(0xFF8A82C3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () => buttonOnPressed,
      child: Center(child: Text(buttonText)),
    );
  }
}
