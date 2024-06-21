import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loyalty_business_project/pages/home_page/home_page.dart';
import 'package:loyalty_business_project/pages/initial_page/initial_page.dart';
import 'package:loyalty_business_project/pages/product_builder_page/product_builder_page.dart';
import 'package:loyalty_business_project/pages/products_page/products_page.dart';
import 'package:loyalty_business_project/pages/purchase_builder/purchase_builder_page.dart';
import 'package:loyalty_business_project/pages/qr_page/qr_screen.dart';
import 'package:loyalty_business_project/pages/sign_in_page/sign_in_page.dart';
import 'package:loyalty_business_project/pages/sign_up_page/sign_up_page.dart';
import 'package:loyalty_business_project/pages/user_wallet_page/components/gc_exchange_page/gc_exchange_page.dart';
import 'package:loyalty_business_project/pages/user_wallet_page/user_wallet_page.dart';
import 'package:loyalty_business_project/providers/auth_state.dart';
import 'package:loyalty_business_project/providers/loyalty_wallet_provider.dart';
import 'package:loyalty_business_project/providers/user_provider.dart';
import 'package:loyalty_business_project/services/local_storage.dart';
import 'package:loyalty_business_project/theme/theme_constans.dart';
import 'package:provider/provider.dart';

import 'theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager.instance;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthState(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider.instance,
        ),
        ChangeNotifierProvider(
          create: (context) => LoyaltyWalletProvider.instance,
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
          title: 'Material App',
          initialRoute: 'initial',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: {
            'login': (BuildContext context) {
              final authState = context.watch<AuthState>();
              return authState.isLoggedIn ? const HomePage() : const SignInPage();
            },
            'sign_up' : (BuildContext context) => const SignUpPage(),
            'initial' : (BuildContext context) => const InitialPage(),
            'qr_screen' : (BuildContext context) => const QRViewScreen(),
            HomePage.route : (BuildContext context) => const HomePage(),
            'wallet' : (BuildContext context) => const UserWalletPage(),
            'gift_gc' : (BuildContext context) => const GiftGCPage(),
            PurchaseBuilderPage.route : (BuildContext context) => const PurchaseBuilderPage(),
            ProductBuilderPage.route : (BuildContext context) => const ProductBuilderPage(),
            ProductListPage.route : (BuildContext context) => const ProductListPage(),
          },
        ),
    );
  }

}
