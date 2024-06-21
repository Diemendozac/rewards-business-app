import 'package:flutter/material.dart';
import 'package:loyalty_business_project/widgets/colored_safe_area.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../products_page/products_page.dart';
import '../purchase_builder/purchase_builder_page.dart';

class HomePage extends StatelessWidget {
  static String route = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(.025),
        elevation: 0,
        title: Text(
          userProvider.user?.username ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/business.jpg'), // Cambia la ruta de la imagen según tu proyecto
              radius: 20,
            ),
          ),
        ],
      ),
      body: ColoredSafeArea(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                context,
                icon: Icons.shopping_cart,
                label: 'Productos',
                onTap: () {
                  Navigator.pushNamed(context, ProductListPage.route);
                },
              ),
              _buildButton(
                context,
                icon: Icons.receipt,
                label: 'Pedido',
                onTap: () {
                  Navigator.pushNamed(context, PurchaseBuilderPage.route);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.pushNamed(context, 'qr_screen');
        },
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
