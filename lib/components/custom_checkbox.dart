import 'package:flutter/material.dart';
import 'package:kuseng/components/text_field_container.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {Key? key,
      required this.callback,
      required this.value,
      required this.child})
      : super(key: key);

  final void Function(bool?)? callback;
  final Widget child;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          child,
          const Spacer(),
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
