import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroborocompany/Ui/homescreen.dart';

import '../Bloc/OtpVerification/otp_verification_bloc.dart';

class OtpVerification extends StatefulWidget {
  final String phone;

  const OtpVerification({super.key, required this.phone});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

TextEditingController otp = TextEditingController();
final form_key = GlobalKey<FormState>();
String otp1='';
class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(key: form_key,
        child: Column(
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
                              return 'Please Enter your Otp';
                            }
                            return null;
                          },
                            onSaved: (value) {
                              otp1 = value!.trimRight();
                            },
                            controller: otp,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: 'Enter Otp',
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
              child: BlocListener<OtpVerificationBloc, OtpVerificationState>(
                listener: (context, state) {
                  if (state is OtpVerificationblocLoading) {
                    showDialog(
                        context: context,
                        builder: (BuildContext a) =>
                            const Center(child: CircularProgressIndicator()));
                  }
                  if (state is OtpVerificationblocError) {
                    Navigator.of(context).pop();
                  }
                  if (state is OtpVerificationblocLoaded) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Home()));
                    print("Loaded");
                  }
                },
                child: TextButton(
                  child: Text('Verify'),
                  onPressed: () {
    final isvalid = form_key.currentState?.validate();
    if (isvalid == true) {
                    BlocProvider.of<OtpVerificationBloc>(context).add(
                        FetchOtpVerification(
                            otp: otp.text,
                            phone: widget.phone,
                            clientId: 'OroboroTestClient'));
                  }}
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
