import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String hint;
  final IconData? ic;
  final TextEditingController controller;
  final bool? obscure;

  const InputText(
      {Key? key,
      required this.hint,
      this.ic,
      required this.controller,
      this.obscure = false})
      : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscure! ? true : false,
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.ic),
          border: const OutlineInputBorder(),
          hintText: widget.hint),
    );
  }
}
