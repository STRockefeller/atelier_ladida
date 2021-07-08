import 'package:atelier_ladida/Data/appBarWidget.dart';
import 'package:atelier_ladida/Data/settings.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  Widget buildThemeDropDown() => DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: const ["blue", "orange"],
      label: "Theme",
      onChanged: (String? color) {
        switch (color) {
          case "orange":
            GlobalSettings.settings.themeColorSetting = enumThemeColor.orange;
            break;
          default:
            GlobalSettings.settings.themeColorSetting = enumThemeColor.blue;
            break;
        }
      },
      selectedItem:
          GlobalSettings.settings.themeColorSetting.toString().split('.').last);
      Widget buildLanguageDropDown() => DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: const ["中文", "日本語"],
      label: "Language",
      onChanged: (String? language) {
        switch (language) {
          case "日本語":
            GlobalSettings.settings.languageSetting = enumLanguage.japanese;
            break;
          default:
            GlobalSettings.settings.languageSetting = enumLanguage.chinese;
            break;
        }
      },
      selectedItem:
          GlobalSettings.settings.languageSetting.displayName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.buildAppBar(context, "Settings"),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              buildThemeDropDown(),
              buildLanguageDropDown(),
              ElevatedButton(
                  onPressed: () => Setting.writeSetting(),
                  child: const Text("Save")),
                  const Text("Hint: The theme will be activated after restarting the application")
            ],
          ),
        ));
  }
}
