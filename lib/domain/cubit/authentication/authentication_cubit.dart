import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_api_auth/data/repository/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationCubit({required this.authenticationRepository})
      : super(AuthenticationInitial());

  Future signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String password2,
  }) async {
    try {
      emit(AuthenticationInProgress());
      String _response = await authenticationRepository.signup(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          password2: password2);
      print(_response);
      if (_response != null) {
        emit(AuthenticationSuccess());
        return _response;
      }
    } catch (e) {
      emit(AuthenticationFailture(error: e.toString()));
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthenticationInProgress());
      String _response = await authenticationRepository.login(
          email: email, password: password);
      print(_response);
      if (_response != null) {
        emit(AuthenticationSuccess());
        return _response;
      }
    } catch (e) {
      emit(AuthenticationFailture(error: e.toString()));
    }
  }
}
