import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF3b3b3b),
      ),
      child: Icon(icon, color: Colors.white, size: 25),
    );
  }
}
