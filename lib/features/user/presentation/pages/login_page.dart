import 'package:authentication_firebase/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:authentication_firebase/share/presentation/widgets/button_square_with_image.dart';
import 'package:authentication_firebase/share/presentation/widgets/button_long.dart';
import 'package:authentication_firebase/share/presentation/widgets/custom_text_field.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          try {
            if (state.isAuthenticated) {
              debugPrint('User is Authenticated');
              debugPrint('User is Authenticated: ${state.user?.name}');
              // TODO: check this --------------------
              SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
                Navigator.pushNamed(context, 'register');
              });
              // TODO: check this --------------------
            } else {
              debugPrint('User is not Authenticated');
            }
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Icon(
                      Icons.blur_on_sharp,
                      size: 100,
                      color: Colors.blue[800],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    ButtonLong(
                      text: 'Sign In',
                      onTap: () {
                        debugPrint('Email: ${emailController.text}');
                        debugPrint('Password: ${passwordController.text}');
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          BlocProvider.of<UserBloc>(context, listen: false).add(
                            AuthenticateUserWithEmailEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          debugPrint(
                            'Mensaje de error. Uno o ambos campos estan vacios!',
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        ButtonSquareWithImage(
                          imagePath: 'assets/images/google.png',
                          imageSize: 40,
                          myOnTap: () {
                            debugPrint('Google');
                            BlocProvider.of<UserBloc>(
                              context,
                              listen: false,
                            ).add(LogoutUserEvent());
                          },
                        ),
                        const SizedBox(width: 25),
                        ButtonSquareWithImage(
                          imagePath: 'assets/images/apple.png',
                          imageSize: 40,
                          myOnTap: () {
                            debugPrint('Apple');
                            debugPrint(
                              'User is Authenticated?: ${state.isAuthenticated}',
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            SchedulerBinding.instance.scheduleFrameCallback((
                              timeStamp,
                            ) {
                              Navigator.pushReplacementNamed(
                                context,
                                'register',
                              );
                            });
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } catch (e) {
            debugPrint('Problem ----');
            debugPrint(e.toString());
            return Container();
          }
        },
      ),
    );
  }
}
