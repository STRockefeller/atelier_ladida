import 'package:atelier_ladida/Data/item.dart';
import 'package:dio/dio.dart';
class NetworkClient {
  Future<List<Item>> getItems(String atelier)async{
    const url = "https://script.google.com/macros/s/AKfycbx6h5Plvkr6xOrVnQAhXNZy6tyGXfB5s02MtmWQdqYcqzDRRpHq9AaDmEAzNiQRCHM/exec";
    String range = atelier+"!A2:R";
    final response = await Dio().get(
        url,
        queryParameters: {
          "range": range
        }
    );
    List<Item> res = <Item>[];
    for (int index = 0; index < response.data.length ; index ++) {
      final item = response.data[index];
      List<String> attr = <String>[];
      List<String> type = <String>[];
      List<String> source = <String>[];
      if(item[2]!=""){attr.add(item[2]);}
      if(item[3]!=""){attr.add(item[3]);}
      if(item[4]!=""){attr.add(item[4]);}
      if(item[5]!=""){attr.add(item[5]);}
      if(item[6]!=""){attr.add(item[6]);}
      if(item[7]!=""){type.add(item[7]);}
      if(item[8]!=""){type.add(item[8]);}
      if(item[9]!=""){type.add(item[9]);}
      if(item[10]!=""){type.add(item[10]);}
      if(item[11]!=""){type.add(item[11]);}
      if(item[12]!=""){type.add(item[12]);}
      if(item[13]!=""){source.add(item[13]);}
      if(item[14]!=""){source.add(item[14]);}
      if(item[15]!=""){source.add(item[15]);}
      if(item[16]!=""){source.add(item[16]);}
      int no = double.parse(item[0]).toInt();
      res.add(Item(no,item[1] as String,attr,type,source,item[17] as String));
    }
    return res;
  }
}