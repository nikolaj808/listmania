import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/cubits/auth/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Profile',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 32.0),
          ClipOval(
            child: Image.network(
              (context.read<AuthCubit>().state as Authenticated).user.photoURL!,
              height: 96,
              width: 96,
            ),
          ),
        ],
      ),
    );
  }
}
