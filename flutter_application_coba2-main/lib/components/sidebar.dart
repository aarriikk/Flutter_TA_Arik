import 'package:flutter/material.dart';
// import 'package:my_app/components/button.dart';
import 'package:my_app/screens/layout.dart';
import 'package:my_app/screens/sidebarMenu/about.dart';
import 'package:my_app/screens/sidebarMenu/help.dart';
// import 'package:my_app/screens/sidebarMenu/setting.dart';
import 'package:my_app/services/auth_service.dart';
import '../screens/auth/register.dart';

class SidebarComponent extends StatefulWidget {
  const SidebarComponent({super.key});
  @override
  State<SidebarComponent> createState() => _SidebarComponentState();
}

class _SidebarComponentState extends State<SidebarComponent> {
  final AuthService authService = AuthService();

  void signUserOut() async {
    authService.signOutUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            height: 100,
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Menu',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LayoutPage()));
            },
            leading: const Icon(
              Icons.home,
              size: 35,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Support',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            leading: const Icon(
              Icons.info_outline,
              size: 35,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HelpPage()));
            },
            leading: const Icon(
              Icons.help_outline,
              size: 35,
            ),
            title: const Text(
              'Help',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => const SettingPage()));
          //   },
          //   leading: const Icon(
          //     Icons.settings,
          //     size: 35,
          //   ),
          //   title: const Text(
          //     'Setting',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage()));
            },
            leading: const Icon(
              Icons.app_registration,
              size: 35,
            ),
            title: const Text(
              'Register Account',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.zero,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: signUserOut,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Color.fromARGB(255, 223, 15, 15),
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
