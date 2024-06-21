import 'package:flutter/material.dart';
import 'package:loyalty_business_project/models/loyalty_wallet/loyalty_wallet.dart';
import 'package:loyalty_business_project/pages/user_wallet_page/components/customer_info/customer_info.dart';
import 'package:loyalty_business_project/providers/loyalty_wallet_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';


class UserWalletPage extends StatefulWidget {
  const UserWalletPage({super.key});

  @override
  State<UserWalletPage> createState() => _UserWalletPageState();
}

class _UserWalletPageState extends State<UserWalletPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  LoyaltyWalletProvider? loyaltyWalletProvider;
  bool _loading = true;
  bool _findData = true;
  LoyaltyWallet? loyaltyWallet;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    loyaltyWalletProvider?.loyaltyWallet = null;
    loyaltyWallet = null;
  }

  @override
  Widget build(BuildContext context) {
    loyaltyWalletProvider = Provider.of<LoyaltyWalletProvider>(context);
    String id = ModalRoute.of(context)?.settings.arguments as String;
    if (_findData) getCustomerWalletData(id, context);
    TextStyle titleStyle = Theme.of(context).textTheme.titleSmall!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Skeletonizer(
            enabled: _loading,
            child: Text(
              loyaltyWallet?.customerInfo.firstName ?? 'UserName',
              style: titleStyle,
            )),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.onSurface),
            onPressed: () => Navigator.of(context).popUntil((route) {
                  return route.settings.name == 'home';
                })),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: const CustomerInfoPage(),
    );
  }

  Future<void> getCustomerWalletData(String id, BuildContext context) async {
    _findData = false;
    dynamic response = await loyaltyWalletProvider!.findLoyaltyWallet(id);
    if (response == 200) {
      _loading = true;
      setState(() {
        loyaltyWallet = loyaltyWalletProvider!.loyaltyWallet;
        _loading = false;
      });
    }
    if (response == 404) {
      if (context.mounted) showAlertDialog(id, context);
    }
  }

  void showAlertDialog(String id, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text(
              '¿Quieres agregar al usuario a tu lista de usuarios leales?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                dynamic response =
                    await loyaltyWalletProvider?.enrollLoyaltyWallet(id);
                if (response == 201) {
                  _findData = true;
                  if (context.mounted) Navigator.of(context).pop;
                }
              },
              child: const Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para 'No'
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == 'home');
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
