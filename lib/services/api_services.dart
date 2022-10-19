import 'package:http/http.dart' as http;
import 'package:http_flutter/models/product_model.dart';

var baseUrl = "https://dummyjson.com";

getPosts() async {
  Uri url = Uri.parse("$baseUrl/products");
  var res = await http.get(url);
  print(url);

  // if (res.statusCode == 200) {
  //   var data = productModelFromJson(res.body);
  //   return data.products;
  // } else {
  //   print("Error in connecting api ");
  // }

  try {
    if (res.statusCode == 200) {
      var data = productModelFromJson(res.body);
      return data.products;
    } else {
      print("Error in connecting api ");
      print(url);
    }
  } catch (e) {
    print(e.toString());
  }
}
