import 'package:coleman/injection.dart';
import 'package:coleman/resources/dimens.dart';
import 'package:coleman/resources/text_styles.dart';
import 'package:coleman/ui/login_module/bloc/login_bloc.dart';
import 'package:coleman/ui/login_module/bloc/login_event.dart';
import 'package:coleman/ui/login_module/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt.get<LoginBloc>(),
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<_LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('error'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginStateSuccess){
          _goToMainMenu();
        }
      },
      builder: (ctx, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.big),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logoWidget(),
                  _emailPasswordWidget(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _logoWidget() {
    return const Text('image');
  }

  Widget _emailPasswordWidget(LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            fillColor: Colors.blueAccent,
            filled: true,
            hintText: 'Enter your Email',
            hintMaxLines: 1,
            hintStyle: AppStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.medium),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: Dimens.normal,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
            fillColor: Colors.blueAccent,
            filled: true,
            hintText: 'Enter your Password',
            hintMaxLines: 1,
            hintStyle: AppStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.medium),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: Dimens.big,
        ),
        Container(
          alignment: Alignment.center,
          height: Dimens.xlarge,
          child: state is LoginStateProcessing
              ? const CircularProgressIndicator()
              : ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              context.read<LoginBloc>().add(
                LoginEventPressed(_emailController.text,
                    _passwordController.text),
              );
            },
          ),
        ),
      ],
    );
  }

  void _goToMainMenu() {
    print('go to main Menu');
  }
}
