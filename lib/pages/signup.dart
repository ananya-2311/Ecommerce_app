import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:shopping_app/db/users.dart';
import 'package:shopping_app/pages/home.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController phoneInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;


  @override
  initState() {
    nameInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();


    batch = [];
    batchSelected = '';

    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  List<String> subject = [
    'English',
    'Maths',
    'Physics',
    'Chemistry',
    'EM',
    'EG',
    'EME',
    'BEE',
    'CPP'
  ];
  String selectedSubject;

  List batch;
  String batchSelected;

  saveForm() {
    var form = _registerFormKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        batchSelected = batch.toString();
      });
    }
  }

  static const TextStyle White16Style = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 60,
                ),
                child: Image.asset("images/signup.jpg"),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Form(
              key: _registerFormKey,
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 240.0),
                      child: Text(
                        'Shoppyy',
                        style: GoogleFonts.alice(textStyle: Black20Style),
                      ),
                    ),
                    SizedBox(height: 95),
                    Container(
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'SignUp',
                              style: GoogleFonts.alice(textStyle: Black20Style),
                            ),
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Name",
                                labelText: "Name",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              textInputAction: TextInputAction.next,
                              controller: nameInputController,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Invalid name';
                                else
                                  return null;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Email ID.",
                                labelText: "Email ID.",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),

                            TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 22.0,
                                    color: Colors.black26,
                                  ),
                                  hintText: "Phone No.",
                                  labelText: "Phone No.",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 16.0),
                                ),
                                controller: phoneInputController,
                                validator: (value) {
                                  if (value.length != 10)
                                    return 'Invalid Phone No.';
                                  else
                                    return null;
                                }),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Password",
                                labelText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              controller: pwdInputController,
                              validator: pwdValidator,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              controller: confirmPwdInputController,
                              validator: pwdValidator,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            if (_registerFormKey.currentState.validate()) {
                              if (pwdInputController.text ==
                                  confirmPwdInputController.text) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text)

                                    .then((currentUser) =>
                                    Firestore.instance
                                        .collection("users")
                                        .document(currentUser.uid)
                                        .setData({
                                      "uid": currentUser.uid,
                                      "fname": nameInputController.text,
                                      "email": emailInputController.text,
                                      "phone": phoneInputController.text,
                                    })
                                        .then((result) =>
                                    {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(
                                                  )),
                                              (_) => false),
                                      nameInputController.clear(),
                                      phoneInputController.clear(),
                                      emailInputController.clear(),
                                      pwdInputController.clear(),
                                      confirmPwdInputController.clear()
                                    })
                                        .catchError((err) => print(err)))
                                    .catchError((err) => print(err));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content:
                                        Text("The passwords do not match"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: Container(
                            width: 130.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)],
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Center(
                                  child: Text(
                                    "SIGNUP",
                                    style: GoogleFonts.average(
                                        textStyle: White16Style),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}