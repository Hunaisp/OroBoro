import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/api/otpverification_api.dart';
import '../../Repository/modelclass/OtpVerifiactionModel.dart';
import '../../Ui/Widgets/toastmessage.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  late  OtpVerifiactionModel otpVerifiactionModel;
  OtpVerificationApi otpVerificationApi =OtpVerificationApi();
  OtpVerificationBloc() : super(OtpVerificationInitial()) {
    on<FetchOtpVerification>((event, emit) async{
      emit(OtpVerificationblocLoading());
      try{
        otpVerifiactionModel = await otpVerificationApi.verifyOtp(event.clientId, event.phone, event.otp);
        ToastMessage().toastmessage(message:otpVerifiactionModel.message.toString());
        emit(OtpVerificationblocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(OtpVerificationblocError());
      }
    });
  }
}
