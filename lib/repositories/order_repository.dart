import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:rastreio/api/track_api.dart';
import 'package:rastreio/models/order.dart';

class OrderRepository extends ChangeNotifier
{
   /*List<Order> orderList = 
  [
    Order(nome: 'teste', estado: 'entregues'),
    Order(nome: 'seila', estado: 'em transferencia'),
    Order(nome: 'nome', estado: 'postado'),
    Order(nome: 'algum', estado: 'devolvido'),
    Order(nome: 'algum', estado: 'devolvido')
  ];

  UnmodifiableListView<Order> get OrderList => UnmodifiableListView(orderList);*/

  List<Order> _orderList = [];
  List<Order> get OrderList => _orderList;

  OrderRepository(){
    fillList();
  }

    track() async
    {
      var trackResult = null;
      int repeats = 0;

      while(trackResult == null && repeats < 10)
      {
        trackResult = await TrackApi.track('QJ180013785BR');

        if(trackResult == null)
        {
          await Future.delayed(Duration(seconds: 3));
        }

        repeats++;
      }
      return trackResult;
      //print(trackResult['codigo']);
    }

    cleanStatus(List<dynamic> data)
    {
      data.forEach((element) {
        element['subStatus'] = element['subStatus'].toString().replaceAll('[', '');
        element['subStatus'] = element['subStatus'].toString().replaceAll(']', '');

        element['subStatus'] = element['subStatus'].toString().replaceAll('Para:', '\nPara:');
      });
    }

    fillList() async {

      var result = await track();

      List<dynamic> data = result['eventos'];

     /* data.forEach((element) {print(element.toString());});
     data.forEach((element) {
       final local = element['local'];
       print(local + 'sapora aqui');
       
     });*/

      cleanStatus(data);
      Order teste = Order(name: 'Carteira', status: data);
      _orderList.add(teste);

      notifyListeners();


    }

}