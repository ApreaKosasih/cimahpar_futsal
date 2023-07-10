import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  bool obscure;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool filled;
  final Color fillColor;
  final FormFieldValidator<String> validator;
  final bool isPassword;

  TextFormFieldCustom({
    Key? key,
    required this.validator,
    required this.text,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.keyboardType = TextInputType.none,
    this.textInputAction = TextInputAction.none,
    this.filled = true,
    this.isPassword = false,
    this.fillColor = Colors.white,
  }) : super(key: key);

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: 'abc',
      obscureText: widget.obscure,
      controller: widget.controller,
      autocorrect: false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: const TextStyle(color: Colors.black),
      validator: widget.validator,
      decoration: InputDecoration(
        //prefix: Text('Prefix'),
        //suffix: Text('Suffix'),
        filled: widget.filled,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        labelText: widget.text,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          icon: widget.isPassword
              ? Icon(
                  widget.obscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.obscure ? Colors.grey : Colors.green,
                )
              : const SizedBox(),
          onPressed: () {
            if (widget.isPassword) {
              setState(() {
                widget.obscure = !widget.obscure;
              });
            }
          },
        ),
      ),
    );
  }
}
