import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const TileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        //elevation: 2,
        margin: EdgeInsets.all(deviceWidth(context) * 0.02),
        child: Container(
          padding: EdgeInsets.all(deviceWidth(context) * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(deviceWidth(context) * 0.001),
            color: Colors.blue.shade50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: deviceWidth(context) * 0.005),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
