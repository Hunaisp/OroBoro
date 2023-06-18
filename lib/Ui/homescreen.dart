import 'package:flutter/material.dart';
import 'package:oroborocompany/Ui/phonenumber.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextButton(
          child: Text('Apply For Loan'),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Phone()));
          },
        ),
      ),
    );
  }
}
