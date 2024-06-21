import 'package:flutter/material.dart';
import 'customer_card.dart';

class CustomerInfoPage extends StatelessWidget {
  const CustomerInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const CustomerCard(),
          const SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              _buildTab('Send Gift Card', Icons.card_giftcard, () {Navigator.of(context).pushNamed('gift_gc');}, context),
              const SizedBox(height: 10,),
              _buildTab('Send Voucher', Icons.local_offer, () {Navigator.of(context).pushNamed('gift_gc');}, context),
              const SizedBox(height: 10,),

              _buildTab('Send Points', Icons.monetization_on, () {Navigator.of(context).pushNamed('gift_gc');}, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, IconData iconData, Function onTap, BuildContext context) {
    return ListTile(

      tileColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Icon(iconData),
      ),
      title: Text(title),
      onTap: () {onTap();},
    );
  }
}
