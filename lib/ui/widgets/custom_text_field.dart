import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.maxLine,
    required this.initialValue,
    required this.onChange,
    required this.hintText,
    required this.title,
    this.isObscureText = false,
    required this.icons,
  }) : super(key: key);

  final int maxLine;
  final String? initialValue;
  final Function(String p1)? onChange;
  final IconData icons;
  final String hintText;
  final String title;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObscureText,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.black,
            ),
        cursorColor: Colors.black,
        maxLines: maxLine,
        initialValue: initialValue,
        onChanged: onChange,
        decoration: buildInputDecoration(icons, hintText, title));
  }
}

InputDecoration buildInputDecoration(
    IconData icons, String hintText, String title) {
  return InputDecoration(
    hintText: hintText,
    labelText: title,
    isDense: true,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
