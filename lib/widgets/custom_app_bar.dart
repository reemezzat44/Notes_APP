import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_container.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    required this.icon, this.onTap,
  });
  final String appBarTitle;
  final IconData icon;
    final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appBarTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.white,
          ),
        ),
        CustomIconContainer(icon: icon,onTap: onTap,),
      ],
    );
  }
}
