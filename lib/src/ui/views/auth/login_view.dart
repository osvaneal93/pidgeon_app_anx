import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pidgeon_app/src/core/utils/colors.dart';
import 'package:pidgeon_app/src/core/utils/styles.dart';
import 'package:pidgeon_app/src/ui/cubit/login/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/zen.png', height: 150),
                SizedBox(
                  height: 30,
                ),
                _CustomTextInput(
                  label: 'email',
                  controller: context.read<LoginCubit>().loginEmailController,
                ),
                SizedBox(
                  height: 20,
                ),
                _CustomTextInput(
                  label: 'Password',
                  controller:
                      context.read<LoginCubit>().loginPasswordController,
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: (() {
                    context.read<LoginCubit>().logInWithCredentials();
                  }),
                  color: colors.primaryGreenblue,
                  child: Text(
                    'Ingresar',
                    style: styles.smallStyle(context,
                        color: colors.onPrimaryBlue, bold: true),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

class _CustomTextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _CustomTextInput({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: styles.smallStyle(context, bold: true),
            ),
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: colors.primaryBlue,
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration.collapsed(hintText: ''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
