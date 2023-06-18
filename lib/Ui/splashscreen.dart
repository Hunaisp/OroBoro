import 'package:flutter/material.dart';
import 'package:oroborocompany/Ui/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void>checkuserlogin()async
  {
    final preferences=await SharedPreferences.getInstance();

    Future.delayed(const  Duration(seconds: 5),(){
      if(!preferences.containsKey('Token'))
      {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) => const  Loginpage()), (
            route) => false);
      }
      else
      {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) => const  Home()), (
            route) => false);
      }
    });}
  @override
  void initState() {
    checkuserlogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: mwidth * 0.45,
          height: mheight * 0.21,
          decoration: BoxDecoration(
              color: const  Color(0xff264050),
              borderRadius: BorderRadius.circular(51)),
          child: Image.asset('asset/Icons/splash_screen_icon.png'),
        ),
      ),
    );
  }
}
