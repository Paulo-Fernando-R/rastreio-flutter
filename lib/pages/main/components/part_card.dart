// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';
import 'package:rastreio/pages/details/details_page.dart';

class PartCard extends StatefulWidget {

  final List data;
  final int index ;
  final String name;

  const PartCard
  ({ 
    required this.data,
    required this.index,
    required this.name,
    Key? key 
  }) : super(key: key);

  @override
  State<PartCard> createState() => _PartCardState();
}

class _PartCardState extends State<PartCard> {
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
            Navigator.push
            (
              context, 
              MaterialPageRoute
              (
                builder: (context) =>  DetailsPage(index: widget.index)
              )
            );
          },
        child: Ink(
          
          height: 130,
          width: double.infinity - 50,
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
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              Icon
              (
                Icons.check_circle,
                color: AppColors.primary,
                size: 100,
              ),
      
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: SizedBox
                (
                  width: (MediaQuery.of(context).size.width-50)/3*2,
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Text
                      (
                        widget.name,//'Nome da enomenda',
                        style: AppFonts.cardMain,
                      ),
      
                      SizedBox(height: 7,),
      
                      Text
                      (
                         widget.data.first['status'],//'Estado da encomenda',
                        style: AppFonts.cardState,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}