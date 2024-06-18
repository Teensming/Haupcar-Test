import 'package:flutter/material.dart';

import 'categories.dart';
import 'listproduct.dart';

class Tabpage extends StatefulWidget {
  const Tabpage({super.key});

  @override
  State<Tabpage> createState() => _TabpageState();
}

class _TabpageState extends State<Tabpage> {
  int selectpage = 0;

  void selectpagefnc(int index) {
    setState(() {
      selectpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage;
    // Ensure activepage is assigned a value on every execution path
    if (selectpage == 0) {
      activepage = CategoriesPage();
    } else if (selectpage == 1) {
      activepage = ListProductPage();
    } else {
      // Provide a fallback/default widget in case selectpage has an unexpected value
      activepage = CategoriesPage();
    }

    return Scaffold(
      body: activepage,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'List Product'),
        ],
        currentIndex: selectpage,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: selectpagefnc,
      ),
    );
  }
}
