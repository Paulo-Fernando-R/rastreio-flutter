// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rastreio/api/track_api.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';
import 'package:rastreio/dialogs/add_edit_dialog.dart';
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
      trackResult = await TrackApi.track('QJ180013785BR');

      if(trackResult == null)
      {
        await Future.delayed(Duration(seconds: 3));
      }

      repeats++;
    }
    
    //print(trackResult['eventos']);
    List<dynamic> data = trackResult['eventos'];
    data.forEach((element) {print(element.toString());});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      

      /*appBar: PreferredSize
      (
        preferredSize: Size.fromHeight
        (
          MediaQuery.of(context).size.height
        ), 
          child: Appbar(),
        
      ),*/
      //fundo de tuso
      body: RefreshIndicator
      (
        onRefresh: () async {
          
        },
        child: Container
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
          //coluna pricipal
          child: Column(
            children: 
            [
              //appbar
              Expanded
              (
                flex: 1,
                child: Appbar()
              ),
      
              //corpo
              Expanded
              (
                flex: 2,
                //fundo corpo
                child: Container
                (
                  width: double.infinity,
                  height: double.infinity,
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
                      return orders.OrderList.isEmpty
                      ? Container
                      (
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator
                        (
                           color: AppColors.primary,
                           
                           
                        ),
                      )
                      : ListView.builder
                      (
                        /*scrollDirection: Axis.vertical,
                        shrinkWrap: true,*/
                        itemCount: orders.OrderList.length, 
                        itemBuilder: (_, index)
                        {
                          return PartCard
                          (
                            name: orders.OrderList[index].name,
                            data: orders.OrderList[index].status,
                            index: index,);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton
      (
        onPressed: () => {
          showDialog
          (
            context: context, 
            builder: (BuildContext context)
            {
              return AddEditDialog();
            }
          )
       
        },
        backgroundColor: AppColors.secondary,
        child: Icon(Icons.add),
      ),

      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton
      (
        isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: AppColors.secondary,
        splashColor: AppColors.primary,
        elevation: 5,
        onPressed: () {
          
        },
      ),

      bottomNavigationBar: SizedBox
      (
        height: 60,
        child: BottomAppBar
        (
          shape: CircularNotchedRectangle(),
          color: AppColors.primary,
          notchMargin: 7,
          elevation: 10,
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: 
            [
              IconButton(onPressed: () {
                
              }, icon: Icon
              (
                Icons.archive_rounded), 
                color: AppColors.primaryDarkText,
                iconSize: 30,
              ),
              
              IconButton(onPressed: () {
                
              }, icon: Icon
              (
                Icons.info_rounded), 
                color: AppColors.primaryDarkText,
                iconSize: 30,
              )
            ],
          ),
        ),
      ),*/















































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

