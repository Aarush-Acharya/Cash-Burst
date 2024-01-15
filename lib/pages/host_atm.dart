import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:fineartsociety/services/appwrite_service.dart';
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

class HostAtm extends StatelessWidget {
  HostAtm({super.key});

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

  List<dynamic> textControllers = [
    TextEditingController(),
    SingleValueDropDownController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    SingleValueDropDownController(),
  ];

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
  Widget build(BuildContext context) {
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
                          'assets/host_atm.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Let the Money Roll In",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                      ),
                      SizedBox(
                        height: 0.04 * MediaQuery.sizeOf(context).height,
                      ),
                      SizedBox(
                        width: 0.7 * MediaQuery.sizeOf(context).width,
                        child: Text(
                          "Hosting a CoinFlip Bitcoin ATM in your business can be a steady source of passive income and increased foot traffic for your business.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 0.025 * MediaQuery.sizeOf(context).height,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    color: Color(0xffFFF7EE),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Store Information",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(color: Colors.black, fontSize: 35),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Name of store"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[0],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Are you the owner of store? "),
                                SizedBox(
                                  height: 10,
                                ),
                                DropDownTextField(
                                  controller: textControllers[1],
                                  clearOption: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: 6,
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'Yes', value: "value1"),
                                    DropDownValueModel(
                                        name: 'No',
                                        value: "value2",
                                        toolTipMsg:
                                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Street address of store"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[2],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("City of store"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[3],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("State of store"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[4],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Postal Code of store"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[5],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Store Type"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[6],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Contact Information",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(color: Colors.black, fontSize: 35),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Name of store owner or point of contact"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[7],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Point of contact phone no. "),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[8],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Point of contact email address"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: textControllers[9],
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255))),
                                    filled: true,
                                    fillColor: Color(0xffE8E8E8),
                                  ),
                                  cursorOpacityAnimates: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Preferred method of communication"),
                                SizedBox(
                                  height: 10,
                                ),
                                DropDownTextField(
                                  controller: textControllers[10],
                                  clearOption: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: 6,
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'Phone Number', value: "value1"),
                                    DropDownValueModel(
                                        name: 'Email',
                                        value: "value2",
                                        toolTipMsg:
                                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Material(
                            child: InkWell(
                              onTap: () {
                                Map<dynamic, dynamic> formData = {
                                  "name": textControllers[0].text,
                                  "isOwner":
                                      textControllers[1].dropDownValue.name ==
                                              "Yes"
                                          ? true
                                          : false,
                                  "address": textControllers[2].text,
                                  "city": textControllers[3].text,
                                  "state": textControllers[4].text,
                                  "postalCode": textControllers[5].text,
                                  "type": textControllers[6].text,
                                  "pocName": textControllers[7].text,
                                  "pocPhone": textControllers[8].text,
                                  "pocEmail": textControllers[9].text,
                                  "commIsEmail":
                                      textControllers[10].dropDownValue.name ==
                                              "Email"
                                          ? true
                                          : false,
                                };
                                print(formData.length);
                                print(formData);
                                database.createDocument(
                                    databaseId: "65a027f395f1e92fcffc",
                                    collectionId: "65a0282e19dcb9285496",
                                    documentId: ID.unique(),
                                    data: formData);
                              },
                              borderRadius: BorderRadius.circular(80),
                              child: Ink(
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: appThemeColour,
                                    borderRadius: BorderRadius.circular(80)),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
