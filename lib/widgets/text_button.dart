import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RichTextButton extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onClick;

  const RichTextButton(
      {required this.text1,
      required this.text2,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: text1,
            style: const TextStyle(color: Color(0xff858997)),
            children: <InlineSpan>[
          TextSpan(
              text: ' $text2',
              style: const TextStyle(color: Color(0xff00ADB5)),
              recognizer: TapGestureRecognizer()..onTap = onClick)
        ]));
  }
}
