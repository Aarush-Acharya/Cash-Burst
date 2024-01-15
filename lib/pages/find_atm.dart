import 'dart:async';
import 'dart:convert';
import 'package:fineartsociety/utils/constants.dart';
import 'package:fineartsociety/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../widgets/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';
import 'dart:math' as math;
part 'find_atm.g.dart';

class CheckBoxStates {
  CheckBoxStates({required this.state1, required this.state2});
  bool state1;
  bool state2;
}

@riverpod
class Value extends _$Value {
  @override
  CheckBoxStates build() => CheckBoxStates(state1: false, state2: false);

  void changeState(int index) {
    if (index == 0) {
      state = CheckBoxStates(state1: !state.state1, state2: state.state2);
    } else {
      state = CheckBoxStates(state1: state.state1, state2: !state.state2);
    }
  }
}

class FindAtm extends ConsumerWidget {
  FindAtm({super.key});

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
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CheckBoxStates state = ref.watch(valueProvider);
    return Scaffold(
      endDrawer: HangerDrawer(),
      backgroundColor: appThemeColour,
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight =
              MediaQuery.of(context).size.height * 0.9325153374;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Find A Location",
                        softWrap: true,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 0.05 * MediaQuery.sizeOf(context).height,
                    ),
                    SizedBox(
                      width: 0.7 * MediaQuery.sizeOf(context).width,
                      child: Text(
                        "Search using address city and state or ZIP",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 0.03 * MediaQuery.sizeOf(context).height,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width > 1000
                                ? 500
                                : 0.8 * MediaQuery.sizeOf(context).width,
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                ),
                                label: const Text('Find Location'),
                                hintText: 'Enter your search',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Transform.rotate(
                              angle: 45 * math.pi / 180,
                              child: Icon(Icons.navigation_rounded))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.04 * MediaQuery.sizeOf(context).height,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          height: 300,
                          width: double.maxFinite,
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.04 * MediaQuery.sizeOf(context).height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I want to: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Checkbox(
                            value: state.state1,
                            onChanged: (onChanged) {
                              ref.read(valueProvider.notifier).changeState(0);
                            }),
                        Text(
                          "Buy",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Checkbox(
                            value: state.state2,
                            onChanged: (onChanged) {
                              ref.read(valueProvider.notifier).changeState(1);
                            }),
                        Text(
                          "Sell",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          "Use our locator to find a location near you or browse our directory"),
                    ),
                    SizedBox(
                      height: 0.11 * MediaQuery.sizeOf(context).height,
                    ),
                  ]),
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
