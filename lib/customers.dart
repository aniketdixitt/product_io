import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:product_io/screens/nearby.dart';
import 'routing.dart' as routing;

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  int _currentIndex = 0;
  List screens = [NearbyShops(), NearbyShops(), NearbyShops()];
  @override
  _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
      if (value == 2) {
        Navigator.pushNamedAndRemoveUntil(
            context, routing.loginID, (route) => false);
        Fluttertoast.showToast(
            msg: "Logged OUT Successfully!",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            fontSize: 15);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Shops Nearby"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Sign out"),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
