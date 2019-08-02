import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_playground/validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPhone = GlobalKey<FormState>();

  final TextEditingController _number = new TextEditingController();
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
            Expanded(
              child: _getTabBarPages(),
              flex: 1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_tabController.index == 0) {
            if (_formKeyEmail.currentState.validate()) {
              Navigator.of(context).pushNamed("/setpassword");
            }
          } else {
            if (_formKeyPhone.currentState.validate()) {}
          }
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _getTabBar() {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black87,
          indicatorPadding: EdgeInsets.only(left: 30, right: 30),
          indicator: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(),
          ),
          tabs: [
            new Tab(
              text: "Email",
            ),
            new Tab(
              text: "Phone",
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTabBarPages() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        email(),
        phone(),
      ],
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

  Widget phone() {
    return Form(
      key: _formKeyPhone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextFormField(
              controller: _number,
              maxLength: 10,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      debugPrint('222');
                      _number.clear();
                    }),
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintText: '###-###-####',
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (!Validator.validateNumber(value)) {
                  return 'Please enter a valid phone number.';
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
