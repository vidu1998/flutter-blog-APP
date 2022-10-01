import 'package:blog_flutter_tutorial/admin/categoryDetails.dart';
import 'package:blog_flutter_tutorial/admin/postDetails.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../page/login.dart';

class DashBoard extends StatefulWidget {
  final name;
  final email;
  const DashBoard({super.key, this.name="Guest", this.email=""});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              )),
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
            ),
            ListTile(
              onTap: () {
                debugPrint("Home");
              },
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetails(),
                  ),
                );
                debugPrint("Add Category");
              },
              leading: Icon(Icons.label),
              title: Text(
                'Add Category',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                debugPrint("contact us");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>PostDetails(),
                  ),
                );
              },
              leading: Icon(Icons.contacts),
              title: Text(
                'Add Post',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            widget.name == "Guest"
                ? ListTile(
                    onTap: () {
                      debugPrint("login");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Login',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      debugPrint("Logout");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    leading: Icon(Icons.lock_open),
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        
      ),
      drawer: menuDrawer(),

    );
  }
}
