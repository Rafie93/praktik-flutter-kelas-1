import 'package:flutter/material.dart';

class MinumanPage extends StatefulWidget {
  const MinumanPage({super.key});

  @override
  State<MinumanPage> createState() => _MinumanPageState();
}

class _MinumanPageState extends State<MinumanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman minuman")),
      body: Container(),
    );
  }
}
