import 'package:flutter/material.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';

class Appbar extends StatefulWidget {
  const Appbar({ Key? key }) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container
    (
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.5,
      //color: AppColors.primary,
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.only
        (
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0)
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
                    height: 35,
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
        ],
      ),
    );
  }
}