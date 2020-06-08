import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../utils/colors.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool enabled;
  final double height;
  final int maxLines;

  const CustomFormField(
      {Key key,
      this.labelText,
      this.icon,
      this.keyboardType = TextInputType.text,
      this.isPasswordField = false,
      this.controller,
      this.enabled = true,
      this.height,
      this.maxLines})
      : super(key: key);
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(top: 18.0),
        labelText: widget.labelText.toUpperCase(),
        labelStyle: AppTextStyles.formLabelTextStyle,
        prefixIcon: Icon(
          widget.icon,
          color: CustomColors.formIconColor,
        ),
        border: InputBorder.none,
        suffixIcon: widget.isPasswordField
            ? _buildPasswordFieldVisibilityToggle()
            : null,
      ),
      keyboardType: widget.keyboardType,
      style: AppTextStyles.textFieldTextStyle,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.isPasswordField ? _obscureText : false,
      controller: widget.controller,
      enabled: widget.enabled,
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
