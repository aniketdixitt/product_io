import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'routing.dart' as routing;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height * 0.30,
              child: Image(
                image: AssetImage('images/market.png'),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_rounded,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade800)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: "Enter Email",
                  labelStyle: TextStyle(color: Colors.green.shade500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height * 0.02,
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade800)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    labelText: "Enter Password",
                    labelStyle: TextStyle(color: Colors.green.shade500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.green,
                    )),
              ),
            ),
            SizedBox(
              width: width,
              height: height * 0.04,
            ),
            Container(
              child: TextButton(
                  onPressed: () async {
                    var signin = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    if (signin != null) {
                      var details = await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(email)
                          .get();
                      String ty = "";
                      String em = "";
                      if (details.exists) {
                        Map<String, dynamic> mp = details.data()!;
                        ty = mp["Type"];
                        em = mp["Email"];

                        if (ty == "Shopkeeper") {
                          Fluttertoast.showToast(
                              msg: "Logged in Successfully!",
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 3,
                              fontSize: 15);
                          Navigator.pushNamedAndRemoveUntil(
                              context, routing.shopkeeper, (route) => false,
                              arguments: em);
                        } else if (ty == "Customer") {
                          Fluttertoast.showToast(
                              msg: "Logged in Successfully!",
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 3,
                              fontSize: 15);
                          Navigator.pushNamedAndRemoveUntil(
                              context, routing.customerPage, (route) => false,
                              arguments: em);
                        }
                      }
                      print(
                          ty); //tells whether the user is customer or shopkeeper
                    }
                  },
                  child: Text(
                    "Login",
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
            SizedBox(
              height: height * 0.01,
              width: width,
            ),
            Flexible(
              child: Container(
                width: width,
                height: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /*Text("Don't have an Account?"),
                    TextButton(
                        onPressed: () {}, child: Text("Create Account!")),*/
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Dont have an Account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: " Create Account!",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, routing.signupID);
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
