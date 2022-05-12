import 'package:flutter/material.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';

class Appbar2 extends StatefulWidget {
  const Appbar2({ Key? key }) : super(key: key);

  @override
  State<Appbar2> createState() => _Appbar2State();
}

class _Appbar2State extends State<Appbar2> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize
      (
        
        preferredSize: Size.fromHeight(200),
        child: Container
        (
          width: double.infinity,

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
            ),

            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0))
          ),
          //coluna principal
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: 
            [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                //primeira linha
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: BackButton
                      (
                        color: AppColors.primaryLightText,
                        onPressed: (){Navigator.pop(context);}
                        
                      ),
                    ),
                    Text
                    (
                      'Nome da encomenda',
                      style: AppFonts.mainTitle,
                    ),
                 
                    IconButton
                    (
                      onPressed: () 
                      {
                        print('enoix');
                      }, 
                      icon: Icon
                      (
                        Icons.more_vert,
                        color: AppColors.primaryLightText ,
                      )
                    )
                  ],
                ),
              ),
              //segunda linha
              Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: 
                [
                  //codigo
                  Row
                  (
                    children: 
                    // ignore: prefer_const_literals_to_create_immutables
                    [
                      Icon
                      (
                        Icons.qr_code,
                        size: 25,
                        color: AppColors.secondaryLightText,
                      ),
                      SizedBox(width: 5,),
                      Text
                      (
                        'AB123456789BR',
                        style: AppFonts.detailsInfo,
                      )
                    ],
                  ),
                  //tempo
                  Row
                  (
                    children: 
                    // ignore: prefer_const_literals_to_create_immutables
                    [
                      Icon
                      (
                        Icons.timelapse_outlined,
                        size: 25,
                        color: AppColors.secondaryLightText,
                      ),
                      SizedBox(width: 5,),
                      Text
                      (
                        '222 dias',
                        style: AppFonts.detailsInfo,
                      )
                    ],
                  ),
                  //tipo
                  Row
                  (
                    children: 
                    // ignore: prefer_const_literals_to_create_immutables
                    [
                      Icon
                      (
                        Icons.local_post_office_sharp,
                        size: 25,
                        color: AppColors.secondaryLightText,
                      ),
                      SizedBox(width: 5,),
                      Text
                      (
                        'Sedex',
                        style: AppFonts.detailsInfo,
                      )
                    ],
                  )
                ],
              )

            ],
          ),
        ),
      );
  }
}