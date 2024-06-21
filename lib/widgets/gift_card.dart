import 'package:flutter/material.dart';
import 'package:loyalty_business_project/widgets/buttons.dart';

class GiftCardWidget extends StatefulWidget {
  const GiftCardWidget({super.key});

  @override
  State<GiftCardWidget> createState() => _GiftCardWidgetState();
}

class _GiftCardWidgetState extends State<GiftCardWidget> {
  int _amount = 20;

  void _decreaseAmount() {
    setState(() {
      if (_amount > 0) {
        _amount--;
      }
    });
  }

  void _increaseAmount() {
    setState(() {
      _amount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 600,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 2,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Redimir GC',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _decreaseAmount,
                    icon: const Icon(Icons.remove),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$$_amount',
                        style: const TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(''

                      )
                    ],
                  ),
                  IconButton(
                    onPressed: _increaseAmount,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Expanded(child: Container()),
              TemplateButton.createPrimaryButton('Debit Card', () {}, context)
            ],
          ),
        ),
      ),
    );
  }
}
