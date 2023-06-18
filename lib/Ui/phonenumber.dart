import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Otp/otp_bloc.dart';
import 'otpverification.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

TextEditingController phone = TextEditingController();
final form_key = GlobalKey<FormState>();
String phone1='';
class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: mheight * 0.3,
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
                        child: TextFormField(validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Phone Number';
                          }
                          return null;
                        },
                          onSaved: (value) {
                            phone1 = value!.trimRight();
                          },
                          controller: phone,
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              hintText: 'Enter Phone Number',
                              hintStyle: TextStyle(color: Color(0xff90A4AE))),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: mheight * 0.03,
          ),
          Center(
            child: BlocListener<OtpBloc, OtpState>(
              listener: (context, state) {
                if (state is OtpblocLoading) {
                  showDialog(
                      context: context,
                      builder: (BuildContext a) =>
                          const Center(child: CircularProgressIndicator()));
                }
                if (state is OtpblocError) {
                  Navigator.of(context).pop();
                }
                if (state is OtpblocLoaded) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => OtpVerification(phone: phone.text,)));
                  print("Loaded");
                }
              },
              child: TextButton(
                child: Text('Get Otp'),
                onPressed: () {
    final isvalid = form_key.currentState?.validate();
    if (isvalid == true) {
                  BlocProvider.of<OtpBloc>(context).add(FetchOtp(
                      phone: phone.text, clientId: 'OroboroTestClient'));
                }}
              ),
            ),
          ),
        ],
      ),
    );
  }
}
