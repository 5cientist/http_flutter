import 'package:flutter/material.dart';
import 'package:http_flutter/models/product_model.dart';
import 'package:http_flutter/services/api_services.dart';

//add internet permision in androidmainfest.xml

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API"),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product>? product = snapshot.data;
            return ListView.builder(
              itemCount: product!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      leading: Image.network(
                        product[index].thumbnail,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(product[index].title),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                product[index].description,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                maxLines: 2,
                                // style: TextStyle(
                                //   overflow: TextOverflow.clip,
                                // ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                product[index].price.toString(),
                                style:const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
