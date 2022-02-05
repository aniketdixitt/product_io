import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'routing.dart' as routing;

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  String email = "";
  String password = "";
  String cnfrm = "";
  bool loading = false;
  String fn = "";
  String ln = "";
  final _loginFormKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          "PRODUCT IO",
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green[50],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.3,
              child: Image(
                image: AssetImage('images/account.png'),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Flexible(
                    child: TextField(
                      onChanged: (value) {
                        fn = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade800)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.green.shade500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  child: Flexible(
                    child: TextField(
                      onChanged: (value) {
                        ln = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade800)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.green.shade500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  email = value;
                  setState(() {});
                },
                /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This is mandatory";
                    } else if (!isValidEmail(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },*/
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade800)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.green.shade500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            /*Container(
              child: Flexible(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.keyboard,
                      color: Colors.green,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.green.shade500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),*/
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  password = value;
                  setState(() {});
                },
                /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This is mandatory";
                    }
                    return null;
                  },*/
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade800)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.green.shade500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              child: TextButton(
                  onPressed: () async {
                    /*if (_loginFormKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        Navigator.pushNamed(context, routing.selectID);
                      });
                    }*/
                    try {
                      print("hiii");
                      var user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(email)
                          .set({
                        'First Name': fn,
                        'Last Name': ln,
                        'Email': email,
                        'Password': password,
                        'Type': ""
                      });
                      if (user != null) {
                        await Fluttertoast.showToast(
                            msg: "Signed Up Successfully!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            fontSize: 16);
                        Navigator.of(context)
                            .pushNamed(routing.selectID, arguments: email);
                      }
                    } on FirebaseAuthException catch (e) {
                      Fluttertoast.showToast(
                          msg: e.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 3,
                          fontSize: 16.0);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green[200],
                      primary: Colors.green[900],
                      padding: EdgeInsets.fromLTRB(
                          width * 0.1, width * 0.05, width * 0.1, width * 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side:
                          BorderSide(width: 1, color: Colors.green.shade700))),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: width,
                height: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Already have Account? Go to ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: " Log in! ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, routing.loginID);
                              setState(() {});
                            })
                    ]))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
