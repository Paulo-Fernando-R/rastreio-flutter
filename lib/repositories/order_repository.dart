import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:rastreio/models/order.dart';

class OrderRepository extends ChangeNotifier
{
   List<Order> orderList = 
  [
    Order(nome: 'teste', estado: 'entregues'),
    Order(nome: 'seila', estado: 'em transferencia'),
    Order(nome: 'nome', estado: 'postado'),
    Order(nome: 'algum', estado: 'devolvido')
  ];

  UnmodifiableListView<Order> get OrderList => UnmodifiableListView(orderList);
}