import 'package:abm/Authentication/SignUp.dart';
import 'package:abm/Screens/HomePage.dart';
import 'package:abm/Terms%20and%20Conditions/TC.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _email, _pass, _name, _postCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Provide an email";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                              onSaved: (input) => _email = input,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input.length < 6) {
                                  return "6 character is must";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              onSaved: (input) => _pass = input,
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          margin: EdgeInsets.only(right: 3),
                          child: GestureDetector(
                            child: Text(
                              "Don't have an account, ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.green[400],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: GestureDetector(
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                              color: Colors.green[400],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TC()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.0),
        child: Material(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.green[400],
            elevation: 7.0,
            child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                child: Text('SIGN IN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15)))),
      ),
    );
  }
}
