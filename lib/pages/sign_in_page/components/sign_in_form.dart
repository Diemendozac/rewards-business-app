import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_state.dart';
import '../../../providers/token_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/form_validator.dart';
import '../../../utils/style_constants.dart';
import '../../../widgets/buttons.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthState>();
    final userProvider = Provider.of<UserProvider>(context);
    TokenProvider tokenProvider = TokenProvider();

    return Expanded(
        child: Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ..._buildSignUpTextInputs(context),
        Expanded(child: Container()),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TemplateButton.createPrimaryButton('Sign In', () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var tokenResponse =
                    await tokenProvider.saveToken(email, password);
                if (tokenResponse.statusCode == 200) {
                  var userDataResponse = await userProvider.findLoggedInUser();
                  if (userDataResponse.statusCode == 200 && context.mounted) {
                    authState.setLoggedIn(true);
                    Navigator.of(context).pushNamed('/home');
                  } else {
                    authState.logOutUser();
                  }
                }
              }
            }, context),
            const SizedBox(
              height: 5,
            ),
            _buildNewToButton(context),
          ],
        )
      ]),
    ));
  }

  List<Widget> _buildSignUpTextInputs(BuildContext context) {
    return [
      TextFormField(
        style: Theme.of(context).textTheme.titleSmall,
        validator: (value) => FormValidator.validateName(value),
        onSaved: (value) {
          email = value!;
        },
        decoration: StyleConstants.buildTextInputDecoration('Email', context),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
          style: Theme.of(context).textTheme.titleSmall,
          obscureText: !_isPasswordVisible,
          validator: (value) => FormValidator.validatePassword(value),
          onChanged: (value) {
            password = value;
          },
          decoration:
              StyleConstants.buildTextInputDecoration('Password', context)
                  .copyWith(suffixIcon: _buildPasswordSuffixIcon())),
      _buildForgotPasswordButton(context),
    ];
  }

  TextButton _buildForgotPasswordButton(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Forgot password? ',
          style: Theme.of(context).textTheme.bodyLarge,
        ));
  }

  Widget _buildNewToButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('sign_up');
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'New to Loyal Beast? ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ));
  }

  IconButton _buildPasswordSuffixIcon() {
    return IconButton(
      icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}
