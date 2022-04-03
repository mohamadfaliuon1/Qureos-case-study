import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CaseStudyButton extends StatefulWidget {
  final String text;
  final VoidCallback onClick;

  final bool isLoading;

  const CaseStudyButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    required this.onClick,
  }) : super(key: key);

  @override
  _CaseStudyButtonState createState() => _CaseStudyButtonState();
}

class _CaseStudyButtonState extends State<CaseStudyButton> {
  void onTap() {
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: dead_code
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.045,
        width: size.width * 0.2,
        decoration: BoxDecoration(
            color: const Color(0xff00ADB5),
            borderRadius: BorderRadius.circular(9)),
        child: widget.isLoading
            ? const SpinKitThreeBounce(color: Colors.white)
            : Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
      ),
    );
  }
}

class GoogleSignINButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignINButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        'assets/ic_google_login.png',
        height: size.height * 0.03,
      ),
    );
  }
}
