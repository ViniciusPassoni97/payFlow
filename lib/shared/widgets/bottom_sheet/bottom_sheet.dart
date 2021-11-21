import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playflow/shared/themes/app_colors.dart';
import 'package:playflow/shared/themes/app_text_style.dart';
import 'package:playflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidgets extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final String title;
  final String subtitle;
  const BottomSheetWidgets(
      {Key key,
      this.secundaryLabel,
      this.secundaryOnPressed,
      this.title,
      this.subtitle,
      this.primaryLabel,
      this.primaryOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.6))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: AppTextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                style: AppTextStyles.buttonHeading,
                                text: "\n$subtitle",
                              ),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secundaryLabel: secundaryLabel,
                      secundaryOnPressed: secundaryOnPressed,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
