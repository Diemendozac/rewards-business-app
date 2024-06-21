
import 'package:flutter/material.dart';

class TemplateButton {

  static Widget createPrimaryButton(String text, Function onPressed, BuildContext context) {

    double totalWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
        onPressed: () {onPressed();},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            minimumSize: Size(totalWidth , 55)
        ),
        child: Text(text, style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary
        ))
    );
  }
}