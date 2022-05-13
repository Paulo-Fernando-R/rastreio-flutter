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
  final int index;
  const DetailsPage({required this.index, Key? key }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      /*appBar: PreferredSize
      (
        preferredSize: Size.fromHeight(200),
        child: Appbar2(),
      ),*/

      body: Container
      (

         decoration: BoxDecoration
        (
          gradient: LinearGradient
        (
          colors: 
          [
            Color(0xff2d5ab5),
            AppColors.secondary
          ],
          //transform: GradientRotation(7*pi/4),
          //stops: [0, 0.7],
          tileMode: TileMode.clamp
          
        )
        ),

        child: Column(
          children: 
          [
            Expanded
            (
              flex: 1,
              child: Appbar2(),
            ),
            Expanded
            (
              flex: 3,
              child: Container
              (
                 decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                  color: AppColors.primaryLightText
                ),

                child: Consumer<OrderRepository>
                (
                  builder: (context, orders, child)
                  {
                    
                    return orders.OrderList[0].status.isEmpty
                    ? ListTile
                    (
                      leading: Icon(Icons.star),
                      title: Text
                      (
                        'Nada aqui ainda',
                        
                      ),
                    )
                    : ListView.builder
                    (//trocar por index passado por parametro
                      itemCount: orders.OrderList[widget.index].status.length, 
                      itemBuilder: (_, index)
                      {
                        return DetailsCard(status: orders.OrderList[0].status[index],);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        )
       
      ),






    );
  }
}