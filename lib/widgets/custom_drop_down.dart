// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:kuseng/config/controllers.dart';
import '../config/app_constants.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({Key? key}) : super(key: key);

  final List<String> genderList = [
    'Männlich', //Man
    'Weiblich', //Female
    'Sonstiges', //Others
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
        Obx(
          () => DropdownButtonHideUnderline(
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
              items: genderList
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: kCheckBoxTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: signUpController.selectedGender.value.isEmpty
                  ? null
                  : signUpController.selectedGender.value,
              onChanged: (value) {
                signUpController.selectedGender.value = value as String;
                // log.d(signUpController.selectedGender);
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
        ),
      ],
    );
  }
}
