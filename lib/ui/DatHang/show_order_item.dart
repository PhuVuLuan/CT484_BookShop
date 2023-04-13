import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/info_orders_item.dart';

class showOrderItem extends StatefulWidget {
  final info_orders_item dathang;
  const showOrderItem(this.dathang, {super.key});

  @override
  State<showOrderItem> createState() => orderState();
}

class orderState extends State<showOrderItem> {
  var expanded = false;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          orderSummary(),
          if (expanded) orderDetails()
        ],
      ),
    );
  }

  Widget orderDetails () {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      height: min(widget.dathang.soLuongSP * 20.0 + 40, 100),
      child: ListView(
        children: widget.dathang.sanpham
          .map((e) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(e.imgUrl,scale: 16,),
              Text(
                e.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${e.quantity}x ${e.price} vnd',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          )
          .toList(),
      ),
    );
  }

  Widget orderSummary() {
    return ListTile(
      title: Text('${widget.dathang.soTien} vnd'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.dathang.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            expanded = !expanded;
          });
        }, 
      ),
    );
  }
}