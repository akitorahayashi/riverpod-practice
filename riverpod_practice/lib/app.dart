import 'package:flutter/material.dart';
import 'package:riverpod_practice/view/home_page.dart';

class RiverpodPractice extends StatelessWidget {
  const RiverpodPractice({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RPHomePage(),
    );
  }
}
