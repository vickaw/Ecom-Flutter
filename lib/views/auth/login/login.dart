import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../services/alert.service.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../global_widgets/form_container.dart';
import '../../../router.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  final Function(int) changeTab;


  LoginPage({Key key, this.changeTab}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
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
      labelText: "Email Address",
      icon: FlutterIcons.mail_outline_mdi,
      controller: email,
    );

    final passwordField = CustomFormField(
      labelText: "Password",
      icon: FlutterIcons.lock_outline_mco,
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
      text: "Log In",
      onPressed: () async {

        //setState();
        setState(() {
          // showProgress = false;
        });
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

          // Victor Code to login into Firebase datastore
          //
          try {
            final newUser = await _auth.signInWithEmailAndPassword(
                email: email.text, password: password.text);
            print(newUser.toString());
            if (newUser != null) {
              Navigator.of(context).pushNamed(homeViewRoute);
            }
          } catch (e) {
            alert.showAlert(
              context: context,
              message: "Your username/password do not match",
              type: AlertType.error,
            );


          }


        } // End Victor Code for Login
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

