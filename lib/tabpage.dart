import 'package:flutter/material.dart';

import 'categories.dart';

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
    } else {
      activepage = CategoriesPage();
    }

    return Scaffold(
      body: activepage,
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
