import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Art Society',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Cinzel'),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MainPage(),
        // '/artist': (context) => const ArtistPage(),
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
