// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rastreio/api/track_api.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';
import 'package:rastreio/pages/main/components/appbar.dart';
import 'package:rastreio/pages/main/components/part_card.dart';
import 'package:rastreio/repositories/order_repository.dart';


class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {

  track() async
  {
    var trackResult = null;
    int repeats = 0;

    while(trackResult == null && repeats < 10)
    {
      trackResult = await TrackApi.track('AA123456789BR');

      if(trackResult == null)
      {
        await Future.delayed(Duration(seconds: 3));
      }

      repeats++;
    }
    
    print(trackResult['codigo']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: PreferredSize
      (
        preferredSize: Size.fromHeight
        (
          MediaQuery.of(context).size.height
        ), 
          child: Appbar(),
        
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
                return PartCard();
              },
            );
          },
        )
       
      ),

      floatingActionButton: FloatingActionButton
      (
        child: Icon(Icons.add),
        backgroundColor: AppColors.secondary,
        splashColor: AppColors.primary,
        onPressed: () {
          
        },
      ),















































      //codigo antigo que faz o radius negativo 
     /* backgroundColor: AppColors.primaryLightText,
      body: Column
      (
        children: 
        [//cabecaçho fundo
          Container
          (
            width: double.infinity,
            height: MediaQuery.of(context).size.height/2.5,
            //color: AppColors.primary,
            decoration: BoxDecoration
            (
              borderRadius: BorderRadius.only
              (
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(70)
              ),
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
          
            
            child: Column
            (//para colocar o caontainer de baixo
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  //coluna principal
                  child: Expanded(
                    child: Column
                    (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: 
                      [//primeira linha
                        Row
                        (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: 
                          [//wellcome
                            Column
                            (
                              children: 
                              // ignore: prefer_const_literals_to_create_immutables
                              [
                                Text
                                (
                                  'Bem vindo',
                                  style: AppFonts.mainTitle
                                ),
                            
                                SizedBox(height: 3,),
                            
                                Text
                                (//mudar para parametro
                                  'Nome do usuario',
                                  style: AppFonts.subtitleLight
                                )
                              ],
                            ),
                            
                            ClipRRect
                            (
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset
                              (
                                'images/a.png',
                                 width: 55,
                                 height: 55,
                              ),
                            )
                          ],
                        ),
                            
                        SizedBox(height: 30,),
                            
                        SizedBox
                        (//pesquisa
                          height: 30,
                          width: MediaQuery.of(context).size.width-60,
                          child: TextField
                          (
                            style: AppFonts.textField,
                            
                            textAlignVertical: TextAlignVertical.bottom,
                            
                            decoration: InputDecoration
                            (
                              filled: true,
                              fillColor: AppColors.primaryLightText,
                              hintText: 'Pesquisar',
                              
                            
                              suffixIcon: Icon
                              (
                                Icons.search,
                                color: AppColors.primaryDarkText,
                              ),
                            
                              border: OutlineInputBorder
                              (
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none
                              )
                             
                            ),
                          ),
                        ),
                            
                        SizedBox(height: 30,),
                            
                        Text
                        (
                          'Resumo das encomendas',
                          style: AppFonts.titleRegular
                        ),
                            
                        SizedBox(height: 15,),
                            
                        Row//resumo principal row
                        (
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: 
                          [
                            Column
                            (
                              children: 
                              [
                                Text
                                (
                                  'Total',
                                  style: AppFonts.smallTexts
                                ),
                            
                                SizedBox(height: 7,),
                            
                                Text
                                (//trocar
                                  'qtd',
                                  style: AppFonts.smallTexts,
                                )
                              ],
                            ),
                            
                            Container
                            (
                              height: 40,
                              width: 1,
                              color: AppColors.secondaryLightText,
                            ),
                            
                            Column
                            (
                              children: 
                              [
                                Text
                                (
                                  'Entregues',
                                  style: AppFonts.smallTexts
                                ),
                            
                                SizedBox(height: 7,),
                            
                                Text
                                (//trocar
                                  'qtd',
                                  style: AppFonts.smallTexts,
                                )
                              ],
                            ),
                            
                              Container
                            (
                              height: 40,
                              width: 1,
                              color: AppColors.secondaryLightText,
                            ),
                            
                            Column
                            (
                              children: 
                              [
                                Text
                                (
                                  'Pendentes',
                                  style: AppFonts.smallTexts
                                ),
                            
                                SizedBox(height: 7,),
                            
                                Text
                                (//trocar
                                  'qtd',
                                  style: AppFonts.smallTexts,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /* Container
                (margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),
                  width: double.infinity,
                  height: 40,
                
                  decoration: BoxDecoration
                  ( color: AppColors.primaryLightText,

                    borderRadius: BorderRadius.only
                    (
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),

                    border: Border.all(color: AppColors.primaryLightText, style: BorderStyle.none, width: 0)
                  ),
                )*/
              ],
            ),
          ),

       /*   ListBody
          (
            mainAxis: Axis.vertical,
            
            children: 
            [
              Container
              (
                width: double.infinity,
                height: 50,
                color: Colors.black,
              ),
              Container
              (
                width: double.infinity,
                height: 50,
                color: Colors.amber,
              ),Container
              (
                width: double.infinity,
                height: 50,
                color: Colors.blue,
              ),
            ],
          )*/
        ],
      )*/
    );
  }
}

