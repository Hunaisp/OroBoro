import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroborocompany/Repository/modelclass/loginmodel.dart';

import '../../Repository/api/loginapi.dart';
import '../../Ui/Widgets/toastmessage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late  LoginModel loginModel;
  LoginApi tokenApi =LoginApi();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit)async {
      emit(LoginblocLoading());
      try{
        loginModel = await tokenApi.postuserdata(event.clientId, event.userName, event.password);
        emit(LoginblocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(LoginblocError());
      }
    });
  }
}
