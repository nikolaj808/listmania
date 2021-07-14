import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/constants.dart';
import 'package:listmania/src/cubits/auth/auth_cubit.dart';
import 'package:listmania/src/screens/home/home.screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: kDefaultVerticalPadding),
                Text(
                  'Listmania',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: kDefaultVerticalPadding),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<AuthCubit>().signInWithGoogle();
                  },
                  icon: Icon(Icons.login_rounded),
                  label: Text('Login with Google'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
