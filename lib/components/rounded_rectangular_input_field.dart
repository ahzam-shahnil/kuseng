// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../config/app_constants.dart';
import 'text_field_container.dart';

class RoundedRectangleInputField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textController;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final Iterable<String>? autofillHints;

  final bool? isEnabled;
  final ScrollController scrollController = ScrollController();
  RoundedRectangleInputField({
    Key? key,
    required this.hintText,
    this.icon,
    this.onChanged,
    this.textController,
    this.maxLines,
    this.textInputType,
    this.autofillHints,
    this.isEnabled,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        textCapitalization: textCapitalization,
        enabled: isEnabled,
        enableIMEPersonalizedLearning: true,
        enableInteractiveSelection: true,
        textInputAction: TextInputAction.next,
        enableSuggestions: true,
        autocorrect: false,
        scrollController: scrollController,
        maxLines: maxLines,
        onChanged: onChanged,
        controller: textController,
        cursorColor: kPrimaryColor,
        keyboardType: textInputType,
        autofillHints: autofillHints,
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  color: kPrimaryColor,
                )
              : null,
          hintStyle: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.normal),
          hintText: hintText,
          border: InputBorder.none,
        ),
        minLines: 1,
      ),
    );
  }
}
