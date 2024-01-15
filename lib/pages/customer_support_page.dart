import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fineartsociety/utils/constants.dart';
import 'package:fineartsociety/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../widgets/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';
import 'dart:math' as math;

class CustomerSupport extends ConsumerWidget {
  CustomerSupport({super.key});

  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    var data = await json.decode(response);
    List<dynamic> artists = data['artists'];

    List<dynamic> featuredArtists = artists.where((item) {
      return item['featured'] == true;
    }).toList();
    print(featuredArtists);
    return featuredArtists;
  }

  List<String> steps = [
    "Insert your Bank Card",
    "Select Cash or Bitcoin",
    "Input your Desired Amount",
    "Enter your KYC Verification ( Bitcoin Only )",
    "Receive your Cash or Bitcoin!"
  ];
  List<String> firstFoldList = ["Australia", "Canada"];
  List<String> secondFoldList = ["Rico", "United States"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      endDrawer: HangerDrawer(),
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight =
              MediaQuery.of(context).size.height * 0.9325153374;
          return SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Hero Image
                Container(
                  height: firstFoldHeight,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 0.38 * MediaQuery.sizeOf(context).height,
                        width: 0.87 * MediaQuery.sizeOf(context).width,
                        child: Image.asset(
                          'assets/support.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height:
                              0.1072961373 * MediaQuery.sizeOf(context).height,
                          child: AutoSizeText(
                            "24/7 Award Wining Customer Support",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(color: Colors.black, fontSize: 35),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.025 * MediaQuery.sizeOf(context).height,
                      ),
                      SizedBox(
                        height:
                            0.1244635193 * MediaQuery.sizeOf(context).height,
                        width: 0.7 * MediaQuery.sizeOf(context).width,
                        child: AutoSizeText(
                          "Understanding Crypto can be complicated. You have questions, we've got  answers",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 0.025 * MediaQuery.sizeOf(context).height,
                      ),
                      Container(
                        height:
                            0.0643776824 * MediaQuery.sizeOf(context).height,
                        width: 250,
                        decoration: BoxDecoration(
                            color: appThemeColour,
                            borderRadius: BorderRadius.circular(80)),
                        child: Center(
                            child: Text(
                          "877-757-2646",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        height: 0.025 * MediaQuery.sizeOf(context).height,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height:
                              0.0643776824 * MediaQuery.sizeOf(context).height,
                          width: 375,
                          decoration: BoxDecoration(
                              color: appThemeColour,
                              borderRadius: BorderRadius.circular(80)),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "powerclubglobal@gmail.com",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 4, Use the FooterWidget here
                FooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
