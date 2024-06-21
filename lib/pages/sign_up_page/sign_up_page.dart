
import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/colored_safe_area.dart';
import 'components/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: _buildSignUpContent(context),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TemplateButton.createPrimaryButton('Sign Up', (){
                  Navigator.of(context).pushNamed('home');
                }, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpContent(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return SingleChildScrollView(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create an Account',
            style: textStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          const SignUpForm(),

        ],
      ),

    );
  }
}
