import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    required this.hintText, this.onSaved,  this.onChanged,
  });
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      cursorColor: Colors.greenAccent,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
          enabledBorder: EasyBorder(Colors.white),
          focusedBorder: EasyBorder(Colors.greenAccent),
          border: EasyBorder(Colors.white),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15)),
    );
  }

  OutlineInputBorder EasyBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
