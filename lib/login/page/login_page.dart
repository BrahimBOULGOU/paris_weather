import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import '../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state.loginStatus == LoginStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to login'),
              ),
            );
          }
          if (state.loginStatus == LoginStatus.success) {
            context.goNamed('weatherList',
                queryParameters: {'name': state.userModel?.name});
          }
        }, builder: (context, state) {
          if (state.loginStatus == LoginStatus.loading) {
            return const Material(
                child: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: LoginButton(
                text: 'Login',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                        username: usernameController.text,
                        password: passwordController.text);
                  }
                },
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                              controller: usernameController,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                label: Text(
                                  'Username',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (!_emailRegex.hasMatch(value ?? '')) {
                                  return 'Please enter a valid Email address';
                                }
                                return null;
                              }),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                              label: Text(
                                'Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
}
