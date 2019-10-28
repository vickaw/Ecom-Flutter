import 'package:flutter/material.dart';
import '../../../global_widgets/custom_button.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import '../../../router.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      labelText: 'USERNAME / EMAIL',
      icon: LineIcons.user,
    );

    final passwordField = CustomFormField(
      labelText: 'PASSWORD',
      icon: LineIcons.lock,
      isPasswordField: true,
    );

    final formSpace = SizedBox(height: 20.0);

    final form = FormContainer(
      child: Column(
        children: <Widget>[
          emailField,
          formSpace,
          passwordField,
        ],
      ),
    );

    final submitBtn = CustomButton(text: "Log In", onPressed: () => Navigator.of(context).pushNamed(homeViewRoute));

    final bottomText = Container(
      padding: EdgeInsets.only(top: 70.0),
      child: Text(
        "Don't have an account? Swipe right to \n create a new account.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.withOpacity(0.8),
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[form, formSpace, submitBtn, bottomText],
      ),
    );
  }
}
