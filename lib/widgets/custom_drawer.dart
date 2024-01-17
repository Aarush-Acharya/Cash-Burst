import 'package:fineartsociety/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'custom_drawer.g.dart';

@riverpod
class State extends _$State {
  @override
  int build() => 0;

  void changeState(int index) {
    state = index;
  }
}

class HangerDrawer extends ConsumerWidget {
  const HangerDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int state = ref.watch(stateProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: appThemeColour,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Color(0xff00D631)),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            selected: state == 0 ? true : false,
            selectedColor: Color(0xff00D631),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/');
              ref.read(stateProvider.notifier).changeState(0);
            },
          ),
          ListTile(
            title: const Text('Find ATM'),
            selected: state == 1 ? true : false,
            selectedColor: Color(0xff00D631),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/findAtm');
              ref.read(stateProvider.notifier).changeState(1);
            },
          ),
          ListTile(
            title: const Text('Customer Support'),
            selected: state == 2 ? true : false,
            selectedColor: Color(0xff00D631),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/customerSupport');
              ref.read(stateProvider.notifier).changeState(2);
            },
          ),
          ListTile(
            title: const Text('Host Atm'),
            selected: state == 3 ? true : false,
            selectedColor: Color(0xff00D631),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/hostAtm');
              ref.read(stateProvider.notifier).changeState(3);
            },
          ),
        ],
      ),
    );
  }
}
