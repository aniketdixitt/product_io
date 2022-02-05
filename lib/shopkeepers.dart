import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'screens/shops.dart';
import 'routing.dart' as routing;

class Shopkeepers extends StatefulWidget {
  const Shopkeepers({Key? key}) : super(key: key);

  @override
  _ShopkeepersState createState() => _ShopkeepersState();
}

class _ShopkeepersState extends State<Shopkeepers> {
  int _currentIndex = 0;
  List screens = [Shops(), Shops(), Shops()];
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

  Widget build(BuildContext context) {
    //final em = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "My Shops"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Sign Out"),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
