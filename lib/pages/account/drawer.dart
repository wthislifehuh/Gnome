import 'package:first_app/pages/account/about.dart';
import 'package:first_app/pages/account/favourite.dart';
import 'package:first_app/pages/account/widget/list_tile.dart';
import 'package:first_app/pages/account/settings.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/login_register_page/authentication/auth.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.lightBr,
              image: DecorationImage(
                image: AssetImage('images/GNOME_Logo.png'),
              ),
            ),
            child: Text(
              '𝔾 ℕ 𝕆 𝕄 𝔼',
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: 24,
              ),
            ),
          ),
          GnomeListTile(
            icon: Icons.favorite,
            text: 'F A V O R I T E S',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouritePage()),
              );
            },
          ),
          const Divider(thickness: 1, color: AppColors.lightBr),
          GnomeListTile(
            icon: Icons.settings,
            text: 'S E T T I N G S',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          const Divider(thickness: 1, color: AppColors.lightBr),
          GnomeListTile(
            icon: Icons.info,
            text: 'A B O U T',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          const Divider(thickness: 1, color: AppColors.lightBr),
          GnomeListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: signOut,
          ),
          const Divider(thickness: 1, color: AppColors.lightBr),
        ],
      ),
    );
  }
}
