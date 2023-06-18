

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/api/token_api.dart';
import '../../Repository/modelclass/AccessTokenModel.dart';
import '../../Ui/Widgets/toastmessage.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  late  String? tokenModel;
  TokenApi tokenApi =TokenApi();
  TokenBloc() : super(TokenInitial()) {
    on<FetchToken>((event, emit)async {
      emit(TokenblocLoading());
      try{
        tokenModel = await tokenApi.getToken(event.userName, event.passwordInBase64);
        emit(TokenblocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(TokenblocError());
      }
    });
  }
}
