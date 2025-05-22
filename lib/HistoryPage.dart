import 'package:flutter/material.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: Text("Ini halaman saya aaa"),
      ),
    );
  }
}
