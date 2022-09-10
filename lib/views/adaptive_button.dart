import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: () => handler())
        : ElevatedButton(
            onPressed: () => handler(),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ));
  }
}
