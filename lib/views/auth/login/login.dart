import 'package:flutter/material.dart';
import '../../../generated/i18n.dart';
import '../../../services/alert.service.dart';
import '../../../global_widgets/custom_button.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import '../../../router.dart';

class LoginPage extends StatefulWidget {
  final Function(int) changeTab;

  LoginPage({Key key, this.changeTab}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();



  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AlertService alert = new AlertService();

    final emailField = CustomFormField(
      labelText: I18n.of(context).authFormFieldsEmail,
      icon: LineIcons.envelope,
      controller: email,
    );

    final passwordField = CustomFormField(
      labelText: I18n.of(context).authFormFieldsPassword,
      icon: LineIcons.lock,
      isPasswordField: true,
      controller: password,
    );

    final formSpace = SizedBox(height: 20.0);
    final hr = Divider(
      thickness: 0.45,
    );

    final form = FormContainer(
      child: Column(
        children: <Widget>[
          emailField,
          hr,
          passwordField,
        ],
      ),
    );

    final submitBtn = CustomButton(
      text: I18n.of(context).authLoginButton,
      onPressed: () {
        // Validation
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
        } else if (password.text.isEmpty) {
          alert.showAlert(
            context: context,
            message: "Password is required!",
            type: AlertType.error,
          );
        } else {
          Navigator.of(context).pushNamed(homeViewRoute);
        }
      },
    );

    final bottomText = Container(
      padding: EdgeInsets.only(top: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {
              widget.changeTab(1);
            },
            child: Text(
              "Create",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
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
