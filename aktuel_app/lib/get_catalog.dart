import 'package:aktuel_app/Aktuel_Features.dart';
import 'package:flutter/material.dart';

class get_cataolg extends StatefulWidget {

  Aktuel_Features shop;

  get_cataolg({required this.shop});

  @override
  State<get_cataolg> createState() => _get_cataolgState();
}

class _get_cataolgState extends State<get_cataolg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.shop.Shop_name}"),
      ),
    );
  }
}
