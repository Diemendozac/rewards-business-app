
import 'package:flutter/material.dart';

class StyleConstants {

  static InputDecoration buildTextInputDecoration(String inputLabel, BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0x50bdbdbd),
      contentPadding: const EdgeInsets.all(16),
      label: Text(inputLabel),
      floatingLabelStyle: const TextStyle(color: Colors.transparent),
      labelStyle: Theme.of(context).textTheme.titleSmall,
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
    );
  }

}