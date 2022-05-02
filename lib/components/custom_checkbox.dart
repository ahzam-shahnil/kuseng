// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:kuseng/components/text_field_container.dart';
import '../config/app_constants.dart';

class CheckBoxTextField extends StatelessWidget {
  const CheckBoxTextField(
      {Key? key,
      required this.callback,
      required this.value,
      required this.hintText,
      required this.textEditingController})
      : super(key: key);

  final void Function(bool?)? callback;
  final String hintText;
  final TextEditingController textEditingController;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.words,
              enabled: value,
              enableIMEPersonalizedLearning: true,
              enableInteractiveSelection: true,
              textInputAction: TextInputAction.next,
              enableSuggestions: true,
              autocorrect: false,
              controller: textEditingController,
              cursorColor: kPrimaryColor,
              keyboardType: TextInputType.name,
              style: kCheckBoxTextStyle,
              decoration: InputDecoration(
                // hintStyle: Theme.of(context).textTheme.headline6?.copyWith(
                //       fontWeight: FontWeight.normal,
                //     ),
                hintStyle: kCheckBoxTextStyle,
                hintText: hintText,
                border: InputBorder.none,
              ),
              minLines: 1,
            ),
          ),
          // const Spacer(),
          Checkbox(
            // checkColor: Colors.white,
            checkColor: Colors.white,
            activeColor: Colors.blue,
            tristate: false,
            side: const BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            // shape: ,
            value: value,
            onChanged: callback,
          ),
        ],
      ), //C,
    );
  }
}
