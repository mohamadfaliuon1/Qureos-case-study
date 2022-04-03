import 'package:flutter/material.dart';

import '../../../widgets/button.dart';

class ProfileBody extends StatelessWidget {
  final String email;
  final bool isLoading;
  final VoidCallback logOut;
  const ProfileBody(
      {required this.email,
      required this.isLoading,
      required this.logOut,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Welcome to case study',
          style: TextStyle(
              color: Color(0xff00ADB5),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        const Text(
          'Your Email :',
          style: TextStyle(color: Color(0xff858997)),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          email,
          style: const TextStyle(color: Color(0xff858997)),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CaseStudyButton(text: 'log out', isLoading: isLoading, onClick: logOut)
      ],
    );
  }
}
