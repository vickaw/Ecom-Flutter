import 'package:flutter/material.dart';
import '../../../global_widgets/custom_button.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      labelText: 'EMAIL ADDRESS',
      icon: LineIcons.envelope,
    );

    final formSpace = SizedBox(height: 20.0);

    final form = FormContainer(
      child: Column(
        children: <Widget>[
          emailField,
        ],
      ),
    );

    final submitBtn = CustomButton(text: "Send Email", onPressed: () {});

    final headerText = Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Text(
        "Enter the email address you used to create \n your account and we will email you a link to \n reset your password",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.withOpacity(0.8),
          fontSize: 15.0
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[headerText, form, formSpace, submitBtn],
      ),
    );
  }
}
