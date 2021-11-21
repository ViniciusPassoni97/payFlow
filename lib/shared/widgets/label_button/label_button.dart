import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playflow/shared/themes/app_text_style.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({Key key, this.label, this.onPressed}) : super(key: key);
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
          height: 56,
          child:
              Center(child: Text(label, style: AppTextStyles.buttonHeading))),
    );
  }
}
