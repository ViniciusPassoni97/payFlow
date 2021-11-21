import 'package:flutter/cupertino.dart';
import 'package:playflow/shared/themes/app_colors.dart';
import 'package:playflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:playflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  const SetLabelButtons(
      {Key key,
      this.primaryLabel,
      this.primaryOnPressed,
      this.secundaryLabel,
      this.secundaryOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child:
                LabelButton(label: primaryLabel, onPressed: primaryOnPressed),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
                label: secundaryLabel, onPressed: secundaryOnPressed),
          ),
        ],
      ),
    );
  }
}
