import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../../models/loyalty_wallet/loyalty_wallet.dart';
import '../../../../providers/loyalty_wallet_provider.dart';
import '../../../../utils/form_validator.dart';
import '../../../../utils/style_constants.dart';
import '../../../../widgets/buttons.dart';

class PointsMerchantPage extends StatelessWidget {
  const PointsMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titleTheme = Theme.of(context).textTheme.titleMedium!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          'Add points',
          style: titleTheme,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleSmall,
          validator: (value) => FormValidator.validateEmail(value),
          onSaved: (value) {
            billAmount = double.tryParse(value!)!;
          },
          decoration:
              StyleConstants.buildTextInputDecoration('Bill Total', context),
        ),
        const SizedBox(height: 30,),

        TemplateButton.createPrimaryButton('Add points', (){}, context),

      ]),
    );
  }
}
