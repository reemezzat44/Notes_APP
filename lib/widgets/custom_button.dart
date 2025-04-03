import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  CustomButton({super.key, required this.text, required this.onTap, required this.isLoading});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading? CircularProgressIndicator(backgroundColor: Colors.black,):   Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
