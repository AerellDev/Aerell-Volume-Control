import 'package:aerell_volume_control/src/pages/about_page.dart';
import 'package:aerell_volume_control/src/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum PopUpMenuList {
  setting,
  about
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = "/main_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_name),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case PopUpMenuList.about:
                  Navigator.restorablePushNamed(context, AboutPage.routeName);
                  break;
                case PopUpMenuList.setting:
                  Navigator.restorablePushNamed(context, SettingPage.routeName);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: PopUpMenuList.setting,
                child: Text(AppLocalizations.of(context)!.setting)
              ),
              PopupMenuItem(
                value: PopUpMenuList.about,
                child: Text(AppLocalizations.of(context)!.about)
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Tidak ada data")
          ],
        ),
      ),
    );
  }
}