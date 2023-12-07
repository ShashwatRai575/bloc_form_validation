import 'package:bloc_form_validation/signin/bloc/signin_bloc.dart';
import 'package:bloc_form_validation/signin/bloc/signin_event.dart';
import 'package:bloc_form_validation/signin/bloc/signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In with Email'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              }),
              TextField(
                controller: _emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(_emailController.text, _passwordController.text)
                  );
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                  controller: _passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(_emailController.text, _passwordController.text)
                  );
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 24.0),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return CupertinoButton(
                      onPressed: () {
                        if(state is SignInValidState){
                          BlocProvider.of<SignInBloc>(context).add(
                    SignInSubmittedEvent (_emailController.text, _passwordController.text)
                  );
                        }
                      },
                      color: (state is SignInValidState)?Colors.blue: Colors.grey,
                      child: const Text('SignIn'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
