import 'package:flutter/material.dart';

import '../../widgets/colored_safe_area.dart';
import 'components/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme
        .of(context)
        .colorScheme
        .background;

    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          //title: _buildGoBackArrow(context),
        ),
        body: Padding(padding: const EdgeInsets.all(20),
          child: _buildSignInContent(context),),

      ),
    );
  }

  Widget _buildSignInContent(BuildContext context) {

    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign in', style: textStyle,),
        const SizedBox(height: 30,),
        const SignInForm()
      ],
    );

  }
}
