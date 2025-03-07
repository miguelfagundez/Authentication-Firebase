import 'package:authentication_firebase/core/utils/enums.dart';
import 'package:authentication_firebase/share/ui/presentation/bloc/ui_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UiBloc, UiState>(
        builder: (_, state) {
          try {
            debugPrint(
              'Home to Login - isAuthenticated = ${state.isAuthenticated.toString()}',
            );
            if (state.isAuthenticated) {
              debugPrint('User is Authenticated in Home');
            } else {
              // TODO: check this --------------------
              SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
                Navigator.pushNamed(context, 'login');
              });
              //Navigator.pushNamed(context, 'login');
              debugPrint('User is not Authenticated Home to Login');
              // TODO: check this --------------------
            }
            return Center(
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<UiBloc>(
                    context,
                    listen: false,
                  ).add(LogoutUserEvent());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('-- LogOut  '), Icon(Icons.logout)],
                ),
              ),
            );
          } catch (error) {
            debugPrint('Problem ----');
            debugPrint(error.toString());
            return Container();
          }
        },
      ),
    );
  }
}
