import 'package:abm/Authentication/SignIn.dart';
import 'package:abm/Screens/HomePage.dart';
import 'package:abm/Terms%20and%20Conditions/TC.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String _email, _pass, _age, _uniqueId;
  List<String> sexDropDown = ['Male', 'Female'];
  var sex = 'Male';
  bool agreeToResearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      'SIGN UP',
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
                    padding: EdgeInsets.only(left: 15, right: 15),
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
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onSaved: (input) => _pass = input,
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Provide an Age";
                              }
                            },
                            onSaved: (input) => _age = input,
                            decoration: InputDecoration(
                                labelText: 'Age',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          ),
                        ),
                        buildDropDownContainer(sexDropDown, sex, "Sex"),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            onSaved: (input) => _uniqueId = input,
                            decoration: InputDecoration(
                                labelText: 'Unique Participant ID',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "(Ontrack, Fitz, Research study ID)\nResearch participants or users from other apps will have an ID that will enable data transfers",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      child: CheckboxListTile(
                    title: Text("I agree to participate in research"),
                    value: agreeToResearch,
                    onChanged: (newvalue) {
                      setState(() {
                        agreeToResearch = !agreeToResearch;
                      });
                    },
                  )),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.green[400],
                        elevation: 7.0,
                        child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                            },
                            child: Text('SIGN UP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15)))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: GestureDetector(
                          child: Text(
                            "Already having an account,",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.green[400],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildDropDownContainer(
      List<String> listName, String listItem, String dropdownName) {
    return Container(
      color: null,
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 60,
        child: DropdownButton<String>(
          dropdownColor: null,
          items: listName.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              sex = newValue;
            });
          },
          hint: Text('Select a Mode'),
          value: sex,
          elevation: 24,
          isExpanded: true,
          itemHeight: 55,
        ),
      ),
    );
  }
}
