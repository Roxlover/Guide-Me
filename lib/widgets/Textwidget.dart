import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String placeholder;
  final String hintText;
  final bool obsoureText;

  const TextFieldWidget({
    Key? key,
    required this.placeholder,
    required this.hintText,
    required this.obsoureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsoureText,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: placeholder,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(200, 30, 129, 176)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
