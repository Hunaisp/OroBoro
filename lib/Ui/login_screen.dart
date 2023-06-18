import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroborocompany/Bloc/Login/login_bloc.dart';
import 'package:oroborocompany/Ui/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Bloc/Token/token_bloc.dart';
import '../Repository/modelclass/AccessTokenModel.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

TextEditingController userName = TextEditingController();
TextEditingController password = TextEditingController();
String username = '';
String lpassword = '';
late String? tokenModel;
final form_key = GlobalKey<FormState>();

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginblocLoading) {
              showDialog(
                  context: context,
                  builder: (BuildContext a) =>
                      const Center(child: CircularProgressIndicator()));
            }
            if (state is LoginblocError) {
              Navigator.of(context).pop();
            }
            if (state is LoginblocLoaded) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Home()));
              print("Loaded");
            }
          },
          child: Form(
            key: form_key,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: mheight * 0.20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  foregroundImage: AssetImage("assets/logo.jpeg"),
                ),
              ),
              SizedBox(
                height: mheight * 0.08,
              ),
              Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.12),
                  child: Container(
                    height: mheight * 0.08,
                    width: mwidth * 0.80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: mheight * 0.05,
                          width: mwidth * 0.60,
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.02),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Username shouldnot be empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                username = value!.trim();
                              },
                              onChanged: (value) {
                                userName.value = TextEditingValue(
                                  text: value.trim(),
                                  selection: userName.selection,
                                );
                              },
                              controller: userName,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: 'userName',
                                  hintStyle:
                                      TextStyle(color: Color(0xff90A4AE))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: mheight * 0.03,
              ),
              Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.12),
                  child: Container(
                    height: mheight * 0.08,
                    width: mwidth * 0.80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: mheight * 0.05,
                          width: mwidth * 0.60,
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.02),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password should not be empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                lpassword = value!.trimRight();
                              },
                              controller: password,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: 'Enter Password',
                                  hintStyle:
                                      TextStyle(color: Color(0xff90A4AE))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: mheight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.08),
                child: BlocListener<TokenBloc, TokenState>(
                  listener: (context, state) {
                    if (state is TokenblocLoading) {
                      showDialog(
                          context: context,
                          builder: (BuildContext a) =>
                              const Center(child: CircularProgressIndicator()));
                    }
                    if (state is TokenblocError) {
                      Navigator.of(context).pop();
                    }
                    if (state is TokenblocLoaded) {
                      print("Loaded");
                      tokenModel =
                          BlocProvider.of<TokenBloc>(context).tokenModel;
                      userInfo(tokenModel!);
                      final isvalid = form_key.currentState?.validate();
                      if (isvalid == true) {
                        form_key.currentState?.save();
                        BlocProvider.of<LoginBloc>(context).add(FetchLogin(
                            clientId: 'OroboroTestClient',
                            password: password.text,
                            userName: userName.text));
                      }
                      else{Navigator.of(context).pop();}
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<TokenBloc>(context).add(FetchToken(
                          passwordInBase64: 'ASBTRYIMNYER654',
                          userName: 'OroboroTestClient'));
                    },
                    child: Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: Center(
                          child: Text(
                        "Log In",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'ppp'),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth * 0.20),
                child: Row(
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                    TextButton(onPressed: () {}, child: Text("Create")),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void userInfo(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('Token', token);
  }
}
