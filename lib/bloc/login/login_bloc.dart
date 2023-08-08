import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/login.dart';
import 'package:flutter_application_1/repository/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      try {
        var value = await loginRepository.login(event.loginReqModel);
        emit(LoginSuccess(value));
      } catch (error) {
        print(error.toString());
        emit(LoginFailure(error.toString()));
      }
    });
  }
}
