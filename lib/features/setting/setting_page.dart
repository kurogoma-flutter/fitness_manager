import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const routeName = 'setting';
  static const routePath = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Setting1'),
            onTap: () {
              Navigator.of(context).pushNamed('setting1');
            },
          ),
          ListTile(
            title: const Text('Setting2'),
            onTap: () {
              Navigator.of(context).pushNamed('setting2');
            },
          ),
          ListTile(
            title: const Text('Setting3'),
            onTap: () {
              Navigator.of(context).pushNamed('setting3');
            },
          ),
        ],
      ),
    );
  }
}
