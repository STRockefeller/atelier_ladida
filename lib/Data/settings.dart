import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Setting {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/setting.ini');
  }

  static Future<File> writeSetting() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(jsonEncode(GlobalSettings.settings.toJson(),
        toEncodable: myDateSerializer));
  }

  static dynamic myDateSerializer(dynamic object) {
    if (object is enumLanguage) {
      return object.displayName;
    } else if (object is enumThemeColor) {
      return object.toString().split('.').last;
    }
    return object;
  }

  static Future readSetting() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      GlobalSettings.settings = jsonDecode(contents);
    } catch (e) {
      GlobalSettings.settings =
          SettingData(enumThemeColor.blue, enumLanguage.chinese);
    }
  }
}

class SettingData {
  enumThemeColor themeColorSetting;
  enumLanguage languageSetting;
  SettingData(this.themeColorSetting, this.languageSetting);
  SettingData.fromJson(Map<String, dynamic> json)
      : themeColorSetting = enumThemeColor.values.firstWhere((element) =>
            element.toString().split('.').last == json['themeColorSetting']),
        languageSetting = enumLanguage.values.firstWhere(
            (element) => element.displayName == json['languageSetting']);
  Map<String, dynamic> toJson() => {
        'themeColorSetting': themeColorSetting,
        'languageSetting': languageSetting,
      };
}

enum enumThemeColor { blue, orange }

extension EnumThemeColorExtension on enumThemeColor {
  MaterialColor get color {
    switch (this) {
      case enumThemeColor.orange:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}

enum enumLanguage { chinese, japanese }

extension EnumLanguageExtension on enumLanguage {
  String get displayName {
    switch (this) {
      case enumLanguage.chinese:
        return "中文";
      case enumLanguage.japanese:
        return "日本語";
      default:
        return "中文";
    }
  }
}

class GlobalSettings {
  static SettingData settings =
      SettingData(enumThemeColor.blue, enumLanguage.chinese);
}
