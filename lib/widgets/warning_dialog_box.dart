import 'package:flutter/material.dart';
import 'package:stay_jigy/pages/home/widgets/dialog_box_button.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';

class WarningDialogBox extends StatelessWidget {
  final String title;

  const WarningDialogBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            3 * SizeConfig.height!,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/warning_shield.png',
                  color: Colors.orange.withOpacity(0.7),
                  height: 3 * SizeConfig.height!,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Warning',
                  style: TextStyle(
                    color: black.withOpacity(0.6),
                    letterSpacing: 0.7,
                    fontSize: 2.5 * SizeConfig.text!,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black.withOpacity(0.4),
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DialogBoxButton(
              onTap: () => Navigator.pop(context),
              btnTxt: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
