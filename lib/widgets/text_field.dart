import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final Function validator;
  final Function onSaved;
  final Function? onFieldSubmitted;
  final Function(String res)? onChange;
  final bool isPassword;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  final bool showPassword;

  final TextEditingController? controller;

  final Function? onIconPressed;

  const MyTextFormField({
    key,
    this.hintText,
    this.label,
    required this.validator,
    required this.onSaved,
    this.isPassword = false,
    required this.textInputType,
    this.onIconPressed,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.showPassword = false,
    this.onChange,
  }) : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late InputBorder _inputBorder;
  bool _showPassword = false;

  @override
  void initState() {
    _inputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(
        color: Color(0xffCFD1D6),
        width: 1,
        style: BorderStyle.solid,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ttttttttttttttttttt');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: const TextStyle(color: Color(0xff858997)),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            onChanged: widget.onChange,

            textInputAction: widget.textInputAction,
            style: const TextStyle(color: Color(0xff858997)),
            decoration: InputDecoration(
              fillColor: Colors.white,
              suffixIcon: _handlePasswordIcon(),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                  color: Color(0xff00ADB5),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: _inputBorder,
              border: _inputBorder,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xff858997),
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.all(8.0),
              filled: true,
            ),
            obscureText: widget.isPassword && !_showPassword,
            //!widget.isPasswordChanged,
            validator: (value) => widget.validator(value),
            onSaved: (value) => widget.onSaved(value),
            controller: widget.controller,
            keyboardType: widget.textInputType,
            focusNode: widget.focusNode,
            onFieldSubmitted: (value) => widget.onFieldSubmitted!(value),
          ),
        ),
      ],
    );
  }

  Widget? _handlePasswordIcon() {
    if (!widget.isPassword) return null;
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
      child: Icon(
        _showPassword ? Icons.visibility : Icons.visibility_off,
        color: const Color(0xffCFD1D6),
      ),
    );
  }
}
