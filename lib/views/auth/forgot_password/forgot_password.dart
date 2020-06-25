import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../services/alert.service.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    AlertService alert = new AlertService();
    final emailField = CustomFormField(
      labelText: 'EMAIL ADDRESS',
      icon: FlutterIcons.mail_outline_mdi,
      controller: email,
    );

    final formSpace = SizedBox(height: 20.0);

    final form = FormContainer(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: <Widget>[
          emailField,
        ],
      ),
    );

    final submitBtn = CustomButton(text: "Send Email", onPressed: () async {
     //print(email.text);
      if (email.text != null) {
        await _auth.sendPasswordResetEmail(email: email.text.toString());

        alert.showAlert(
          context: context,
          message: ("Email sent successfully !"),
          type: AlertType.success,
        );
        email.text = "";
      }

    });

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
