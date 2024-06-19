import 'package:flutter/material.dart';
import 'package:haupcartest/home.dart';
import 'package:haupcartest/statemanagement/provider/Product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Productprovider();
        }),
      ],
      child: MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
