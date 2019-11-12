import 'package:flutter/material.dart';
import '../../../global_widgets/custom_button.dart';
import 'package:line_icons/line_icons.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import '../../../router.dart';

class LoginPage extends StatelessWidget {
  final Function(int) changeTab;

  const LoginPage({Key key, this.changeTab}) : super(key: key);

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

    final submitBtn = CustomButton(
      text: "Log In",
      onPressed: () => Navigator.of(context).pushNamed(homeViewRoute),
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
          SizedBox(width: 5.0,),
          GestureDetector(
            onTap: () {
              changeTab(1);
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
