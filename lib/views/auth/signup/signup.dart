import 'package:flutter/material.dart';
import 'package:hello_shop/services/alert.service.dart';
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
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  AlertService alert = new AlertService();

  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      labelText: 'EMAIL ADDRESS',
      icon: LineIcons.envelope,
      controller: email,
    );

    final usernameField = CustomFormField(
      labelText: 'NAME',
      icon: LineIcons.user,
      controller: name,
    );

    final passwordField = CustomFormField(
      labelText: 'PASSWORD',
      icon: LineIcons.lock,
      isPasswordField: true,
      controller: password,
    );

    final confirmPasswordField = CustomFormField(
      labelText: 'CONFIRM PASSWORD',
      icon: Icons.lock,
      isPasswordField: true,
      controller: confirmPassword,
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
      onPressed: () {
        if (email.text.isEmpty) {
          alert.showAlert(
            context: context,
            message: "Email is required!",
            type: AlertType.error,
          );
        } else if (!email.text.contains('@')) {
          alert.showAlert(
            context: context,
            message: "Email is invalid",
            type: AlertType.error,
          );
        } else if (name.text.isEmpty) {
          alert.showAlert(
            context: context,
            message: "Name is required!",
            type: AlertType.error,
          );
        } else if (password.text.isEmpty) {
          alert.showAlert(
            context: context,
            message: "Password is required!",
            type: AlertType.error,
          );
        } else if (confirmPassword.text != password.text) {
          alert.showAlert(
            context: context,
            message: "Passwords do not match",
            type: AlertType.error,
          );
        } else if (!isChecked) {
          alert.showAlert(
            context: context,
            message: "You have to agree to the Terms of Service and the Privacy Policy",
            type: AlertType.error,
          );
        } else {
          Navigator.of(context).pushNamed(homeViewRoute);
        }
      },
    );

    final defultTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.grey.withOpacity(0.8),
    );

    final linkTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).primaryColor,
    );

    final bottomText = Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "I agree to the",
                        style: defultTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () => _showTermsPolicyDialog(context, false),
                        child: Text("Terms of Service", style: linkTextStyle),
                      ),
                      Text(" and ", style: defultTextStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _showTermsPolicyDialog(context, true),
                        child: Text("Privacy Policy.", style: linkTextStyle),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 60.0,
          )
        ],
      ),
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: <Widget>[form, formSpace, bottomText, submitBtn],
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
