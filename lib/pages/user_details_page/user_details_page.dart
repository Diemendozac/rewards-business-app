import 'package:flutter/material.dart';

import '../../widgets/colored_safe_area.dart';
import '../home_page/components/user_view.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Theme.of(context).colorScheme.background;
    TextStyle titleTheme = Theme.of(context).textTheme.titleMedium!;


    return ColoredSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: titleTheme,),
          backgroundColor: backgroundColor,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // UserView section
            UserView(
              user: User(name: 'John Doe', imageUrl: 'assets/avaters/Avatar 2.jpg'),
            ),
            const SizedBox(height: 20.0),
            // Loyalty Wallet section
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    title: Text('Loyalty Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Link Bank Cards'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Invite Friends'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  ),
                  ListTile(
                    leading: _buildThemeDataIcon(context),
                    title: const Text('Theme'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Language'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.update),
                    title: Text('Check for Updates'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help Center'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('Privacy Policy'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // Profile section
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Personal Details'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Change Password'),
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Sign Out'),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Close Account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeDataIcon (BuildContext context) {

    var brightness = View.of(context).platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    
    return isDarkMode ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode);

  }
}



class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

