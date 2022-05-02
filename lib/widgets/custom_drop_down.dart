// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';

// Project imports:
import '../config/app_constants.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedGender;
  //  'Weiblich'
  List<String> items = [
    'Männlich',
    'Weiblich',
    'Sonstiges',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Geschlecht',
          style: kCheckBoxTextStyle,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            isDense: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    'Wähle',
                    style: kCheckBoxTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: kCheckBoxTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value as String;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            iconSize: 30,
            iconEnabledColor: Colors.grey,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: const Color(0xff5E46B3)),
            buttonElevation: 0,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff5E46B3),
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(-20, 0),
          ),
        ),
      ],
    );
  }
}
