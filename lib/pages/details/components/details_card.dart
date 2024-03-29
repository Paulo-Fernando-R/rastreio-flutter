import 'package:flutter/material.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';

class DetailsCard extends StatefulWidget {

  final  status;

  const DetailsCard
  ({ 
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding
    (padding: EdgeInsets.only
    (
      
      top: 20,
      left: 10,
      bottom: 0,
      right: 10,
        
    ),
        child: InkWell
        (
          borderRadius: BorderRadius.circular(30),
          splashColor: AppColors.secondary.withOpacity(0.2),
          onTap: () {
            print('enoix');
          },
        child: Ink(
          
          height: 200,
          width: MediaQuery.of(context).size.width-50,
          decoration: BoxDecoration
          (
            color: AppColors.primaryLightText,
            borderRadius: BorderRadius.circular(30),
        
            boxShadow: 
            [
              BoxShadow
              (
                color: Colors.black38,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
                offset: Offset.fromDirection(90)
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: 
                  [
                    Icon
                    (
                      Icons.local_shipping_rounded,
                      color: AppColors.primary,
                      size: 100,
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 0),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width-50)/3*2,
                        child: Column
                        (
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: 
                          [//trocar todos os textos por informações
                            Text
                            (
                              widget.status['status'],//'Em trânsito',
                              style: AppFonts.cardMain,
                              overflow: TextOverflow.clip,
                            ),
      
                            SizedBox(height: 5,),
      
                            Text
                            (
                              widget.status['local'],//'De: CTCE Contagem\nContagem / MG ',
                              style: AppFonts.cardState,
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(height: 5,),
                            Text
                            (
                              widget.status['subStatus'].toString(),//'Para: AC São João Evangelista\nSão João Evangelista / MG',
                              style: AppFonts.cardState,
                              overflow: TextOverflow.clip,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: 
                    [
                      Text
                      (
                        widget.status['data'],
                        style: AppFonts.cardStateSecondary,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}