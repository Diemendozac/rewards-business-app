

import 'package:flutter/material.dart';

import '../../user_details_page/user_details_page.dart';

class UserView extends StatelessWidget {
  final User user;

  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    Color mainColor = Theme.of(context).colorScheme.background;

    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      titleTextStyle: Theme.of(context).textTheme.titleSmall!,
      tileColor: mainColor,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(user.imageUrl),
        ),
      ),
      title: Text(user.name),
    );
  }
}