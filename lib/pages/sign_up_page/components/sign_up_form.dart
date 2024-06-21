import 'package:flutter/material.dart';

import '../../../theme/theme_constans.dart';
import '../../../utils/form_validator.dart';
import '../../../utils/style_constants.dart';
import '../../../widgets/lib/phonenumbers.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  String firstName = '';
  String lastName = '';
  String email = '';
  final TextEditingController _dateController = TextEditingController();
  final phoneNumberController = PhoneNumberEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: _buildSignUpForm(),
      ),
    );
  }

  List<Widget> _buildSignUpForm() {
    return [
      TextFormField(
        style: Theme.of(context).textTheme.titleSmall,
        validator: (value) => FormValidator.validateName(value),
        onSaved: (value) {
          firstName = value!;
        },
        decoration: StyleConstants.buildTextInputDecoration('First Name', context),
      ),
      const SizedBox(height: 10,),
      TextFormField(
        style: Theme.of(context).textTheme.titleSmall,
        validator: (value) => FormValidator.validateName(value),
        onSaved: (value) {
          firstName = value!;
        },
        decoration: StyleConstants.buildTextInputDecoration('Last Name', context),
      ),
      const SizedBox(height: 10,),
      TextFormField(
        style: Theme.of(context).textTheme.titleSmall,
        validator: (value) => FormValidator.validateEmail(value),
        onSaved: (value) {
          email = value!;
        },
        decoration: StyleConstants.buildTextInputDecoration('Email', context),
      ),
      const SizedBox(height: 10,),
      TextFormField(
        controller: _dateController,
        style: Theme.of(context).textTheme.titleSmall,
        validator: (value) => FormValidator.validateEmail(value),
        onSaved: (value) {
          email = value!;
        },
        decoration: StyleConstants.buildTextInputDecoration('Date', context),
        readOnly: true,
        onTap: (){_selectDate();},
      ),
      const SizedBox(height: 10,),
      PhoneNumberField(
        controller: phoneNumberController,
        decoration: StyleConstants.buildTextInputDecoration('Phone', context),
        style: Theme.of(context).textTheme.titleSmall,
      ),

    ];

  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: darkTheme,
          child: child!,
          );
      },
        context: context,
        barrierColor: Theme.of(context).colorScheme.primary,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(' ')[0];
      });
    }
  }
}
