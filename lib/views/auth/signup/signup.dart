import 'package:flutter/material.dart';
import 'package:hello_shop/views/auth/widgets/terms_policy_dialog.dart';
import '../../../global_widgets/custom_button.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import '../../../router.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      labelText: 'EMAIL ADDRESS',
      icon: LineIcons.envelope,
    );

    final usernameField = CustomFormField(
      labelText: 'NAME',
      icon: LineIcons.user,
    );

    final passwordField = CustomFormField(
      labelText: 'PASSWORD',
      icon: LineIcons.lock,
      isPasswordField: true,
    );

    final confirmPasswordField = CustomFormField(
      labelText: 'CONFIRM PASSWORD',
      icon: Icons.lock,
      isPasswordField: true,
    );

    final formSpace = SizedBox(height: 20.0);

    final form = FormContainer(
      child: Column(
        children: <Widget>[
          emailField,
          formSpace,
          usernameField,
          formSpace,
          passwordField,
          formSpace,
          confirmPasswordField
        ],
      ),
    );

    final submitBtn = CustomButton(
        text: "Sign Up",
        onPressed: () => Navigator.of(context).pushNamed(homeViewRoute));

    final defultTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.grey.withOpacity(0.8),
    );

    final linkTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).primaryColor,
    );

    final bottomText = Container(
      padding: EdgeInsets.only(top: 70.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Text(
                "I agree to the",
                style: defultTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _showTermsPolicyDialog(context, false),
                child: Text("Terms of Service", style: linkTextStyle),
              ),
              Text(" and ", style: defultTextStyle),
              GestureDetector(
                onTap: () => _showTermsPolicyDialog(context, true),
                child: Text("Privacy Policy.", style: linkTextStyle),
              )
            ],
          )
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[form, formSpace, submitBtn, bottomText],
      ),
    );
  }
}

Future<bool> _showTermsPolicyDialog(BuildContext context, isPrivacyPolicy) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: TermsAndPolicyDialog(isPrivacyPolicy: isPrivacyPolicy),
      );
    },
  );
}
