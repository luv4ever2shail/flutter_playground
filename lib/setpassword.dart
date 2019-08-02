import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_playground/validator.dart';

class SetPassWord extends StatefulWidget {
  @override
  State createState() => SetPassWordState();
}

class SetPassWordState extends State<SetPassWord>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _formKeyEmail = GlobalKey<FormState>();

  final TextEditingController _email = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getTabBar(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_tabController.index == 0) {
            if (_formKeyEmail.currentState.validate()) {}
          }
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _getTabBar() {
    return Material(
      color: Colors.white,
      child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: email()),
    );
  }

  Widget email() {
    return Form(
      key: _formKeyEmail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextFormField(
              controller: _email,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      debugPrint('222');
                      _email.clear();
                    }),
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'test@abc.com',
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!Validator.validateEmail(value)) {
                  return 'Please enter a valid email address.';
                }
                return null;
              },
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
                      text:
                          'By signing up, you confirm that you agree to our '),
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
        ],
      ),
    );
  }
}
