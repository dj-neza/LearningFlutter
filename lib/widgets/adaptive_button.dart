import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveButton extends StatelessWidget {
  final Function showDatePicker;
  final String label;

  AdaptiveButton(this.label, this.showDatePicker);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => showDatePicker(),
          )
        : FlatButton(
            textColor: Theme.of(context).accentColor,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => showDatePicker(),
          );
  }
}
