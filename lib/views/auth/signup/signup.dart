import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../services/alert.service.dart';
import '../../../views/auth/widgets/terms_policy_dialog.dart';
import '../../../global_widgets/custom_button.dart';
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
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      labelText: "Email Address",
      icon: FlutterIcons.mail_outline_mdi,
      controller: email,
    );

    final usernameField = CustomFormField(
      labelText: "Name",
      icon: FlutterIcons.user_fea,
      controller: name,
    );

    final passwordField = CustomFormField(
      labelText: "Password",
      icon: FlutterIcons.lock_outline_mco,
      isPasswordField: true,
      controller: password,
    );

    final confirmPasswordField = CustomFormField(
      labelText: "Confirm Password",
      icon: Icons.lock,
      isPasswordField: true,
      controller: confirmPassword,
    );

    final formSpace = SizedBox(height: 20.0);
    final hr = Divider(thickness: 0.45);

    final form = FormContainer(
      child: Column(
        children: <Widget>[
          emailField,
          hr,
          usernameField,
          hr,
          passwordField,
          hr,
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
            message:
                "You have to agree to the Terms of Service and the Privacy Policy",
            type: AlertType.error,
          );
        } else {
          Navigator.of(context).pushNamed(homeViewRoute);
        }
      },
    );

    final defultTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
      color: Colors.grey.withOpacity(0.8),
    );

    final linkTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
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
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'I agree to the ',
                    style: defultTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service',
                        style: linkTextStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showTermsPolicyDialog(context, false);
                          },
                      ),
                      TextSpan(
                        text: ' and ',
                        style: defultTextStyle,
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: linkTextStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showTermsPolicyDialog(context, true);
                          },
                      )
                    ],
                  ),
                ),
              ),
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
