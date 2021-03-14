import 'package:coleman/injection.dart';
import 'package:coleman/main.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/dimens.dart';
import 'package:coleman/resources/text_styles.dart';
import 'package:coleman/resources/ui_constants.dart';
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
      child: Scaffold(
          body: SafeArea(
        child: _LoginView(),
      )),
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
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameFocus = FocusNode();
  final _passFocus = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(LoginTextResources.login_failed_error),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginStateSuccess) {
          _goToMainMenu();
        }
      },
      builder: (ctx, state) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logoWidget(),
                const SizedBox(height: 40),
                _emailPasswordWidget(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _logoWidget() {
    return Container(
      width: 200,
      child: Image.asset(UIConstants.logo_url),
    );
  }

  Widget _emailPasswordWidget(LoginState state) {
    return Center(
      child: Container(
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _emailField(context, state),
                  const SizedBox(height: Dimens.normal),
                  _passwordField(context, state),
                  const SizedBox(height: Dimens.big),
                  _buttonSection(context, state),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _emailField(BuildContext context, LoginState state) {
    return TextFormField(
      focusNode: _nameFocus,
      autofocus: true,
      onFieldSubmitted: (_) {
        _fieldFocusChange(context, _nameFocus, _passFocus);
      },
      controller: _nameController,
      decoration: _fieldDecoration(
          context,
          LoginTextResources.login_username_hint,
          LoginTextResources.login_username_label,
          false),
      keyboardType: TextInputType.emailAddress,
      validator: _validateName,
    );
  }

  TextFormField _passwordField(BuildContext context, LoginState state) {
    return TextFormField(
      obscureText: _obscureText,
      focusNode: _passFocus,
      onFieldSubmitted: (_) {
        _passFocus.unfocus();
        _submitForm();
      },
      controller: _passwordController,
      decoration: _fieldDecoration(
          context,
          LoginTextResources.login_password_hint,
          LoginTextResources.login_password_label,
          true),
      keyboardType: TextInputType.visiblePassword,
      validator: _validatePassword,
    );
  }

  InputDecoration _fieldDecoration(BuildContext context, String hintText,
      String labelText, bool isPassword) {
    return InputDecoration(
        fillColor: AppColors.formBackgroundColor,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        hintStyle: Theme.of(context).textTheme.bodyText2,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintMaxLines: 1,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.medium)),
          borderSide: BorderSide(
            color: AppColors.formUnfocusedBorderColor,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.medium)),
          borderSide: BorderSide(
            color: AppColors.formUnfocusedBorderColor,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.medium)),
          borderSide: BorderSide(
            color: AppColors.formFocusedBorderColor,
            width: 2,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null);
  }

  Widget _buttonSection(BuildContext context, LoginState state) {
    return (state is LoginStateProcessing)
        ? const CircularProgressIndicator()
        : Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                LoginTextResources.login_login_button,
                style: AppStyles.redButtonTextStyle(context),
              ),
              style: AppStyles.redButtonStyle(context),
              onPressed: () {
                FocusScope.of(context).focusedChild?.unfocus();
                _submitForm();
              },
            ),
          );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      context.read<LoginBloc>().add(
            LoginEventPressed(_nameController.text, _passwordController.text),
          );
    }
  }

  void _goToMainMenu() {
    Navigator.of(context).pushReplacementNamed(AppNavigation.HOME);
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value?.isEmpty == true) {
      return LoginTextResources.login_name_required;
    } else if (value != null && !_nameExp.hasMatch(value)) {
      return LoginTextResources.login_email_wrong_format;
    } else
      return null;
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text.length < 3) {
      return "3 characters are required for password";
    } else
      return null;
  }
}

class LoginTextResources {
  static const login_failed_error = 'Login is failed';
  static const login_username_label = 'Username \u{22c6}';
  static const login_username_hint = 'Input Username';
  static const login_password_label = 'Password \u{22c6}';
  static const login_password_hint = 'Input Password';
  static const login_login_button = 'Log In';
  static const login_name_required = 'Name is required';
  static const login_email_wrong_format = 'Use alphabetical symbols';
}
