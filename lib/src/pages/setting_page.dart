import 'package:aerell_volume_control/src/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const String routeName = "/setting_page";

  @override
  Widget build(BuildContext context) {

    final List<String> themeDataList = [
      AppLocalizations.of(context)!.light,
      AppLocalizations.of(context)!.dark
    ];

    final List<String> languageList = [
      AppLocalizations.of(context)!.indonesia,
      AppLocalizations.of(context)!.inggris
    ];

    // Provider.of<SettingController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setting),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(AppLocalizations.of(context)!.theme),
                const SizedBox(width: 10,),
                Consumer<SettingController>(
                  builder: (context, controller, child) => DropdownButton<ThemeMode>(
                    value: controller.themeMode,
                    onChanged: (value) {
                      switch (value) {
                        case ThemeMode.dark:
                          controller.themeMode = ThemeMode.dark;
                          break;
                        case ThemeMode.light:
                        default:
                          controller.themeMode = ThemeMode.light;
                      }
                    },
                    items: themeDataList.map<DropdownMenuItem<ThemeMode>>(
                      (e) {
                        late ThemeMode theme;
                        switch (e) {
                          case "Dark":
                          case "Gelap":
                            theme = ThemeMode.dark;
                            break;
                          case "Light":
                          case "Terang":
                          default:
                            theme = ThemeMode.light;
                            
                        }
                        return DropdownMenuItem(
                          value: theme, 
                          child: Text(e)
                        );
                      }
                    ).toList(),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.language),
                const SizedBox(width: 10,),
                Consumer<SettingController>(
                  builder: (context, controller, child) => DropdownButton<LanguageSetting>(
                    value: controller.language,
                    onChanged: (value) {
                      switch (value) {
                        case LanguageSetting.indonesia:
                          controller.language = LanguageSetting.indonesia;
                          break;
                        case LanguageSetting.inggris:
                        default:
                          controller.language = LanguageSetting.inggris;
                      }
                    },
                    items: languageList.map<DropdownMenuItem<LanguageSetting>>(
                      (e) {
                        late LanguageSetting theme;
                        switch (e) {
                          case "Indonesia":
                            theme = LanguageSetting.indonesia;
                            break;
                          case "Inggris":
                          case "English":
                          default:
                            theme = LanguageSetting.inggris;
                        }
                        return DropdownMenuItem(
                          value: theme, 
                          child: Text(e)
                        );
                      }
                    ).toList(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}