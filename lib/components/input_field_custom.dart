import 'package:flutter/material.dart';

class InputFieldCustom extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const InputFieldCustom({required this.title, required this.controller});

  @override
  _InputFiledCustom createState() => _InputFiledCustom();
}

class _InputFiledCustom extends State<InputFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.title, border: const OutlineInputBorder()),
    );
  }
}
