import 'package:aktuel_app/Aktuel_Features.dart';
import 'package:aktuel_app/get_catalog.dart';
import 'package:flutter/material.dart';

void main() => runApp(AktuelApp());

class AktuelApp extends StatelessWidget {
  const AktuelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aktuel ",
      home: Main_Page(),
    );
  }
}

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {

  Future<List<Aktuel_Features>> get_Aktuel() async{

    var aktuel_list = <Aktuel_Features>[];
    var shop1 = Aktuel_Features(1, "a101.png", "A101");
    var shop2 = Aktuel_Features(2, "bim.png", "bim");
    var shop3 = Aktuel_Features(3, "sok.png", "sok");
    var shop4 = Aktuel_Features(4, "migros.png", "migros");

    aktuel_list.add(shop1);
    aktuel_list.add(shop2);
    aktuel_list.add(shop3);
    aktuel_list.add(shop4);

    return aktuel_list;
  }

  @override
  Widget build(BuildContext context) {

    var Screen_info = MediaQuery.of(context);
    final double Screen_height = Screen_info.size.height;
    final double Screen_width = Screen_info.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("MARKETLER"),
        centerTitle: true,
      ),
      body:FutureBuilder<List<Aktuel_Features>>(
          future: get_Aktuel(),
          builder: (context,snapshot){

            if(snapshot.hasData){

              var aktuel_list = snapshot.data;

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/2.18,
                  ),
                  itemCount: aktuel_list!.length,
                  itemBuilder: (context,indeks){

                    var shop = aktuel_list[indeks];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> get_cataolg(shop: shop)));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                width: Screen_width/2,
                                height: Screen_height/4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/${shop.Shop_image_name}"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          elevation: 10.0,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                        ),
                      ),
                    );
                  }
              );
            }
            else{
              return Center();
            }
          }
      ) ,

    );
  }
}
