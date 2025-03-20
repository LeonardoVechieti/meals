import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  _createDrawerItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        
        child: Column(children: [
          AppBar(
            title: Text("Vamos Cozinhar?"),
            automaticallyImplyLeading: false,
            titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          _createDrawerItem(Icons.restaurant, "Refeições", () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          }),
          _createDrawerItem(Icons.settings, "Configurações", () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS);
          }),
        ],),
      )
    );
  }
}