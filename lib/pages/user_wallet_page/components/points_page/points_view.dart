import 'package:flutter/material.dart';

class PointsView extends StatelessWidget {
  final int points;
  final Function()? onExchangePressed;

  const PointsView({
    super.key,
    required this.points,
    this.onExchangePressed,
  });

  @override
  Widget build(BuildContext context) {

    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final TextStyle currentTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: onPrimaryColor, fontSize: 12);
    TextStyle titleStyle =
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Points', style: titleStyle),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${points.toString()} Points',
                style: titleStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: onExchangePressed,
                  icon: Icon(Icons.card_giftcard, color: onPrimaryColor,),
                  label: Text(
                    'Purchase GC',
                    style: currentTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: onExchangePressed,
                  icon: Icon(Icons.airplane_ticket, color: onPrimaryColor,),
                  label: Text(
                    'Purchase Voucher',
                    style: currentTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
