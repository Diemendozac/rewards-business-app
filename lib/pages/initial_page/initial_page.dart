import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';
import '../../widgets/colored_safe_area.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});


  @override
  Widget build(BuildContext context) {
    TextStyle logoTheme = Theme
        .of(context)
        .textTheme
        .titleSmall!;

    return ColoredSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Text('Loyalty App', style: logoTheme,),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildFirstView(context),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TemplateButton.createPrimaryButton(
                    'Get Started',
                        () {Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);},
                    context
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstView(BuildContext context) {
    TextStyle titleTheme = Theme
        .of(context)
        .textTheme
        .titleMedium!;
    TextStyle subtitleTheme = Theme
        .of(context)
        .textTheme
        .titleMedium!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rewards Made Simple', style: titleTheme,),
        const SizedBox(height: 30,),
        Text('La forma inteligente de manejar tu dinero', style: subtitleTheme,)
      ],
    );
  }
}
