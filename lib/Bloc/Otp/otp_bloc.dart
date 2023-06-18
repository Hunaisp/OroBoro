import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroborocompany/Repository/modelclass/OtpModel.dart';

import '../../Repository/api/otpapi.dart';
import '../../Ui/Widgets/toastmessage.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  late  OtpModel otpModel;
  OtpApi tokenApi =OtpApi();
  OtpBloc() : super(OtpInitial()) {
    on<FetchOtp>((event, emit)async {
      emit(OtpblocLoading());
      try{
        otpModel = await tokenApi.getOtp(event.clientId, event.phone);
        ToastMessage().toastmessage(message:otpModel.message.toString());
        emit(OtpblocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(OtpblocError());
      }
    });
  }
}
