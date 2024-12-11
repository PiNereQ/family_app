import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  const CustomButton({super.key, required this.text, required this.onPressed, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12.0,
            //offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.white, width: 2.0),
            ),
          backgroundColor: Colors.grey,
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 3.0,
        ),
            onPressed: onPressed, 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
                ),
            ),
        ),
    );
  }
}