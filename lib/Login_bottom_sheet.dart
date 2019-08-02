import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShowLoginBottomModalSheet extends StatelessWidget {
  const ShowLoginBottomModalSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              print('help button pressed');
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
                child: new RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  new TextSpan(text: 'You need a '),
                  new TextSpan(
                      text: 'MySocial\n',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                          fontSize: 25.0)),
                  new TextSpan(
                    text: ' account to continue',
                  ),
                ],
              ),
            )),
          ),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              print('exit button pressed');
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          width: 350.0,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            splashColor: Colors.pinkAccent,
            color: Colors.pink,
            textColor: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text("Sign Up With Phone or Email",
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 20.0)),
                ),
              ],
            ),
            onPressed: () {
              print('Sign up button pressed');
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/recordtrip");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('OR'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: CircleAvatar(
                  child: new Image.asset("assets/images/fblogo.png"),
                  backgroundColor: Colors.transparent,
                  maxRadius: 30.0,
                ),
                onTap: () {
                  print('facebook icon pressed');
                },
              ),
              SizedBox(width: 25.0),
              GestureDetector(
                child: CircleAvatar(
                  child: new Image.asset("assets/images/glogo.png"),
                  backgroundColor: Colors.transparent,
                  maxRadius: 30.0,
                ),
                onTap: () {
                  print('Google icon pressed');
                },
              ),
              SizedBox(width: 25.0),
              GestureDetector(
                child: CircleAvatar(
                  child: new Image.asset("assets/images/twitter.png"),
                  backgroundColor: Colors.transparent,
                  maxRadius: 30.0,
                ),
                onTap: () {
                  print('Twitter icon pressed');
                },
              ),
            ],
          ),
        ),
        Container(
          width: 300.0,
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'By signing up, you confirm that you agree to our '),
                new TextSpan(
                    text: 'Terms of Use',
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => print('Terms of Use Tapped'),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    )),
                new TextSpan(
                  text: ' and have read and understood our ',
                ),
                new TextSpan(
                    text: 'Privacy Policy\n',
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => print('Privacy Policy Tapped'),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    )),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.black87,
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: 'Already have an account? '),
                new TextSpan(
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => print('Log in Tapped'),
                    text: 'Log In',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
