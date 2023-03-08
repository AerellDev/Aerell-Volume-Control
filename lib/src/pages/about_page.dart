import 'package:aerell_volume_control/src/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String routeName = "/about_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(AppLocalizations.of(context)!.createby(AppConfig.createBy)),
            const SizedBox(height: 10,),
            Text(AppLocalizations.of(context)!.version(AppConfig.appVersion!)),
          ],
        ),
      ),
    );
  }
}