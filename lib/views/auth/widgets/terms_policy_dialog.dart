import 'package:flutter/material.dart';
import '../../../utils/lorem_ipsum.dart';
import '../../../utils/colors.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndPolicyDialog extends StatelessWidget {
  final bool isPrivacyPolicy;

  const TermsAndPolicyDialog({Key key, @required this.isPrivacyPolicy})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final underline = Container(
      width: 50.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Colors.grey,
          ),
        ),
      ),
    );

    final header = Column(
      children: <Widget>[
        Container(
          child: Text(
            isPrivacyPolicy ? "Privacy Policy" : "Terms of Service",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 23.0,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        underline
      ],
    );

    final content = SingleChildScrollView(
      padding: EdgeInsets.only(top: 20.0),
      child: Html(
        data: isPrivacyPolicy ? LoremIpsum.privacyPolicy : LoremIpsum.termsOfService,
      ),
    );

    final button = InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: CustomColors.primaryColor,
            borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "I AGREE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.check_circle_outline, color: Colors.white),
          ],
        ),
      ),
    );

    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[header, content, button],
        ),
      ),
    );
  }
}
