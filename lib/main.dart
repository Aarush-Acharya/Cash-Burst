import 'package:fineartsociety/pages/browse_atm.dart';
import 'package:fineartsociety/pages/customer_support_page.dart';
import 'package:fineartsociety/pages/find_atm.dart';
import 'package:fineartsociety/pages/host_atm.dart';
import 'package:fineartsociety/services/appwrite_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';

void main() {
  initializeAppwrite();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bit Burst',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Cinzel'),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MainPage(),
        // '/artist': (context) => const ArtistPage(),
        '/browseAtm': (context) => BrowseAtm(),
        '/findAtm': (context) => FindAtm(),
        '/customerSupport': (context) => CustomerSupport(),
        '/hostAtm': (context) => HostAtm(),
        // '/news': (context) => const NewsPage(),
        // '/allArtist': (context) => const AllArtistsPage(),
        // '/events': (context) => const EventsPage(),
        // '/contact': (context) => const ContactPage(),
        // '/exhibitions': (context) => const ExhibitionPage(),
        // '/indivisualItem': (context) => const IndivisualPage(),
        // '/productsPage': (context) => const ProductsPage()
        // Add more routes as needed
      },
    );
  }
}
