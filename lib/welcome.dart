import 'package:bloc_form_validation/signin/bloc/signin_bloc.dart';
import 'package:bloc_form_validation/signin/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text('Welcome to Bloc Form Validation',
              style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInPage(),
                            )),
                  );
                },
                child: const Text('Sign In with Email', 
                style: TextStyle(fontSize: 18),),
                )
          ],
        ),
      
    );
  }
}
