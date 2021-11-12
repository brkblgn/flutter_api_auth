import 'package:flutter/material.dart';
import 'package:flutter_api_auth/data/repository/authentication_repository.dart';
import 'package:flutter_api_auth/domain/cubit/authentication/authentication_cubit.dart';
import 'package:flutter_api_auth/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthenticationCubit>(
        create: (context) => AuthenticationCubit(
          authenticationRepository: AuthenticationRepository(),
        ),
      ),
    ], child: App());
  }
}
