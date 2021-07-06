import 'dart:html';

import 'package:atelier_ladida/Data/Deserialize.dart';
import 'package:atelier_ladida/Data/item.dart';
import 'package:atelier_ladida/Data/seriesName.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ars_dialog/ars_dialog.dart';

class MainPage extends StatefulWidget {
  EnumSeriesName series;
  MainPage(this.series, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(series);
}

class _MainPageState extends State<MainPage> {
  EnumSeriesName series;
  NetworkClient client = NetworkClient();
  List<Item> items = <Item>[];
  late Item source;
  late Item destination;
  //從Google API獲取資料
  Future<List<Item>> getItems() async {
    return await client.getItems(series.name);
  }

  //建立計算結果popup
  Widget buildResult(String res) => FutureBuilder<ArsDialog>(
      future: getResult(res),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container();
        }
        return snapshot.data;
      });
  Future<ArsDialog> getResult(String res) async {
    return await ArsDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: const Text("Result"),
            content: Text(res))
        .show(context);
  }

  //建立body
  Widget buildItems() => FutureBuilder<List<Item>>(
        future: getItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          }
          items = snapshot.data;
          List<String> nameList = <String>[];
          for (Item item in items) {
            nameList.add(item.name);
          }
          source = items[0];
          destination = items[0];
          return ListView(children: [
            buildSourceDropDown(nameList),
            buildDestinationDropDown(nameList),
            ElevatedButton(
                onPressed: () {
                  buildResult(search());
                },
                child: const Text("Find Route")),
          ], padding: const EdgeInsets.all(30));
        },
      );
  //建立Source ComboBox
  Widget buildSourceDropDown(List<String> nameList) => DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: nameList,
      label: "Source",
      onChanged: setSource,
      selectedItem: nameList[0]);
  //建立Destination ComboBox
  Widget buildDestinationDropDown(List<String> nameList) =>
      DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: nameList,
          label: "Destination",
          onChanged: setDestination,
          selectedItem: nameList[0]);
  //設定source
  void setSource(String? name) =>
      source = items.firstWhere((item) => item.name == name);
  //設定destination
  void setDestination(String? name) =>
      destination = items.firstWhere((item) => item.name == name);
  _MainPageState(this.series);
  String search() {
    String returnValue = "";

    // 1st Level
    bool firstLevelMatchName = destination.source.any((s) => s == source.name);
    bool firstLevelMatchType =
        destination.source.any((s) => source.type.contains(s));
    if (firstLevelMatchName || firstLevelMatchType) {
      returnValue += "First Level:\r\n${source.name}-->${destination.name}";
    }

    // 2nd Level
    bool secondLevelItemLogic(Item item) {
      if (destination.source.contains(item.name)) {
        return true;
      }
      for (String s in destination.source) {
        if (item.type.contains(s)) {
          return true;
        }
      }
      return false;
    }

    Iterable<Item> secondLevelItem =
        items.where((item) => secondLevelItemLogic(item));

    for (Item itemData in secondLevelItem) {
      bool secondLevelMatchName = itemData.source.any((s) => s == source.name);
      bool secondLevelMatchType =
          itemData.source.any((s) => source.type.contains(s));
      if (secondLevelMatchName || secondLevelMatchType) {
        returnValue +=
            "\r\nSecond Level:\r\n${source.name}-->${itemData.name}-->${destination.name}";
      }
    }

    // 3rd Level

    List<Item> thirdLevelItem = <Item>[];

    for (Item secondItem in secondLevelItem) {
      bool thirdLevelItemLogic(Item item) {
        if (secondItem.source.contains(item.name)) {
          return true;
        }
        for (String sourceII in secondItem.source) {
          if (item.type.contains(sourceII)) {
            return true;
          }
        }
        return false;
      }

      var t = items.where((item) => thirdLevelItemLogic(item));
      thirdLevelItem.clear();
      thirdLevelItem.addAll(t);
      thirdLevelItem.toSet().toList();
      for (Item itemData in thirdLevelItem) {
        bool thirdLevelMatchName = itemData.source.any((s) => s == source.name);
        bool thirdLevelMatchType =
            itemData.source.any((s) => source.type.contains(s));
        if (thirdLevelMatchName || thirdLevelMatchType) {
          returnValue +=
              "\r\nThird Level:\r\n${source.name}-->${itemData.name}-->${secondItem.name}-->${destination.name}";
        }
      }
    }

    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(series.buttonName),
        ),
        body: Center(
          child: buildItems(),
        ));
  }
}
