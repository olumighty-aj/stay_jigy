import 'package:flutter/material.dart';
import 'package:stay_jigy/pages/home/widgets/dialog_box_button.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;

  final Function() onContinue;
  const AppDialog({
    super.key,
    this.title,
    this.subTitle,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.height!),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2 * SizeConfig.height!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                color: black.withOpacity(0.6),
                letterSpacing: 0.7,
                fontSize: 2.5 * SizeConfig.text!,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subTitle ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black.withOpacity(0.4),
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DialogBoxButton(
              onTap: onContinue,
              btnTxt: 'Continue',
            ),
            DialogBoxButton(
              onTap: () {
                Navigator.pop(context);
              },
              btnTxt: 'Cancel',
              fontColor: darkBlue,
              color: red.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
