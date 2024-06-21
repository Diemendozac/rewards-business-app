import 'package:flutter/material.dart';

import '../../../../widgets/buttons.dart';
import '../../../../widgets/colored_safe_area.dart';

class GiftGCPage extends StatefulWidget {
  const GiftGCPage({super.key});

  @override
  State<GiftGCPage> createState() => _GiftGCPageState();
}

class _GiftGCPageState extends State<GiftGCPage> {

  double selectedAmount = 10000;

  @override
  Widget build(BuildContext context) {

    final backgroundColor = Theme
        .of(context)
        .colorScheme
        .background;
    final titleTheme = Theme
        .of(context)
        .textTheme
        .titleMedium;

    return ColoredSafeArea(
        color: backgroundColor,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Send Gift Card', style: titleTheme,),
                const SizedBox(height: 30,),
                const Text('Amount'),
                const SizedBox(height: 15,),
                ButtonList(changeState: setAmount),
                Expanded(child: Container()),
                _buildPurchaseVoucher(context, selectedAmount),

              ],
            ),
          ),
        ));
  }

  Widget _buildPurchaseVoucher(BuildContext context, double amount) {
    
    return Column(
      children: [
        
        const SizedBox(height: 20,),
        TemplateButton.createPrimaryButton('Send Gift Card', (){
          Navigator.of(context).pushNamed('home');
        }, context),
      ],
    );
    
  }

  void setAmount(double amount) {
    setState(() {
      selectedAmount = amount;
    });

  }

}

class ButtonList extends StatefulWidget {
  const ButtonList({super.key, required this.changeState});
  final void Function(double) changeState;

  @override
  ButtonListState createState() => ButtonListState();
}

class ButtonListState extends State<ButtonList> {
  int _selectedIndex = 1;

  List<double> amounts = [20000, 50000, 100000];

  void _onButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.changeState(amounts[index]);
    });
  }

  @override
  Widget build(BuildContext context) {

    final selectedColor = Theme.of(context).colorScheme.primary;
    final unselectedColor = Theme.of(context).colorScheme.onBackground;
    final textTheme = Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w300);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            amounts.length, // Número de botones
                (index) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ElevatedButton(
                onPressed: () => _onButtonTapped(index),
                style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(textTheme),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    index == _selectedIndex ? selectedColor : unselectedColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background)
                ),
                child: Text(amounts[index].toInt().toString()),
              ),
            ),
          )
      ),
    );

  }
}









