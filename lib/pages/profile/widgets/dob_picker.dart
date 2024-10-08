import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_jigy/pages/home/widgets/dialog_box_button.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/size/size_config.dart';

class DOBPicker extends StatefulWidget {
  final Function(String) dob;
  const DOBPicker({super.key, required this.dob});

  @override
  State<DOBPicker> createState() => _DOBPickerState();
}

class _DOBPickerState extends State<DOBPicker> {
  int mounth = 1, day = 1;
  int year = DateTime.now().year;
  late String birthday;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4 * SizeConfig.height!),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.5 * SizeConfig.height!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Date of birth',
              style: TextStyle(
                color: black.withOpacity(0.7),
                fontSize: 2.5 * SizeConfig.text!,
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Please select your date of birth it is also used for some calculations.',
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
            SizedBox(
              height: 10 * SizeConfig.height!,
              width: 26 * SizeConfig.height!,
              child: Row(
                children: [
                  SizedBox(
                    width: 6.5 * SizeConfig.height!,
                    child: CupertinoPicker.builder(
                      childCount: mounths.length,
                      itemExtent: 6 * SizeConfig.height!,
                      selectionOverlay: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: blue, width: 1),
                            bottom: BorderSide(color: blue, width: 1),
                          ),
                        ),
                      ),
                      onSelectedItemChanged: (value) {
                        setState(() => mounth = value + 1);
                      },
                      itemBuilder: (itemBuilder, index) {
                        return Center(
                          child: Text(
                            mounths[index],
                            style: TextStyle(
                              color: black.withOpacity(0.7),
                              fontSize: 2.5 * SizeConfig.text!,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 6.5 * SizeConfig.height!,
                    child: CupertinoPicker.builder(
                      childCount: 31,
                      itemExtent: 6 * SizeConfig.height!,
                      selectionOverlay: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: blue, width: 1),
                            bottom: BorderSide(color: blue, width: 1),
                          ),
                        ),
                      ),
                      onSelectedItemChanged: (value) {
                        setState(() => day = value + 1);
                      },
                      itemBuilder: (itemBuilder, index) {
                        return Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: black.withOpacity(0.7),
                              fontSize: 2.5 * SizeConfig.text!,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 6.5 * SizeConfig.height!,
                    child: CupertinoPicker.builder(
                      childCount: 120,
                      itemExtent: 6 * SizeConfig.height!,
                      selectionOverlay: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: blue, width: 1),
                            bottom: BorderSide(color: blue, width: 1),
                          ),
                        ),
                      ),
                      onSelectedItemChanged: (value) {
                        setState(() => year = DateTime.now().year - value);
                      },
                      itemBuilder: (itemBuilder, index) {
                        var now = DateTime.now().year - index;

                        return Center(
                          child: Text(
                            now.toString(),
                            style: TextStyle(
                              color: black.withOpacity(0.7),
                              fontSize: 2.5 * SizeConfig.text!,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DialogBoxButton(
              onTap: () {
                widget.dob('$year-$mounth-$day');
                Navigator.pop(context);
              },
              btnTxt: 'Coutinue',
            ),
            DialogBoxButton(
              onTap: () {
                Navigator.pop(context);
              },
              fontColor: darkBlue,
              color: red.withOpacity(0.7),
              btnTxt: 'Cancel',
            ),
          ],
        ),
      ),
    );
  }
}

List mounths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
