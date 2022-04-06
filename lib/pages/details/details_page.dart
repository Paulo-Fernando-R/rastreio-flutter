// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';
import 'package:rastreio/pages/details/components/appbar2.dart';
import 'package:rastreio/pages/details/components/details_card.dart';
import 'package:rastreio/pages/main/components/part_card.dart';
import 'package:rastreio/repositories/order_repository.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: PreferredSize
      (
        preferredSize: Size.fromHeight(200),
        child: Appbar2(),
      ),

      body: Container
      (
        child: Consumer<OrderRepository>
        (
          builder: (context, orders, child)
          {
            return orders.OrderList.isEmpty
            ? ListTile
            (
              leading: Icon(Icons.star),
              title: Text
              (
                'Nada aqui ainda',
                
              ),
            )
            : ListView.builder
            (
              itemCount: orders.OrderList.length, 
              itemBuilder: (_, index)
              {
                return DetailsCard();
              },
            );
          },
        )
       
      ),






    );
  }
}