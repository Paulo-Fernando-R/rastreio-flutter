// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rastreio/consts/app_colors.dart';
import 'package:rastreio/consts/app_fonts.dart';

class AddEditDialog extends StatefulWidget {
  const AddEditDialog({ Key? key }) : super(key: key);

  @override
  State<AddEditDialog> createState() => _AddEditDialogState();
}

class _AddEditDialogState extends State<AddEditDialog> {

  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  void verifyCod(){
    _valor.text.toUpperCase();
  }


  @override
  Widget build(BuildContext context) {

    _valor.addListener(verifyCod);
    return Dialog(
      insetAnimationCurve: Curves.bounceInOut,
      insetAnimationDuration: Duration(microseconds: 2000),

      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular(30)
      ),

      child: Container(

        width: MediaQuery.of(context).size.width/1,
        height: 220,//MediaQuery.of(context).size.width/1.9,

        decoration: BoxDecoration
        (
          color: AppColors.primaryLightText,
          borderRadius: BorderRadius.circular(30)
        ),

        child: Padding
        (
          padding: const EdgeInsets.only(left: 40, right: 40, top: 15),

          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              Text
              (
                'Adicionar',
                style: AppFonts.dialogTitle
              ),

              SizedBox(height: 20,),

              Form
              (
                key: _form,

                child: Column(

                  children: 
                  [
                    SizedBox
                    (
                      height: 40,

                      child: TextFormField
                      (
                        maxLength: 13,
                        keyboardType: TextInputType.text,
                        controller: _valor,
                        textAlignVertical: TextAlignVertical.center,
                        style: AppFonts.cardState,
                        textCapitalization: TextCapitalization.characters,

                        decoration: InputDecoration
                        (
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 10),
                          suffixIcon: Icon
                          (
                            Icons.qr_code,
                            color: AppColors.secondary,
                          ),

                          counterText: '',
                          counterStyle: TextStyle(fontSize: 0),

                          border: UnderlineInputBorder
                          (
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: AppColors.formBackground,
                          hintText: 'Código de rastreamento'

                        ),
                      ),
                    ),

                    SizedBox(height: 10,),


                   SizedBox
                    (
                      height: 40,

                      child: TextFormField
                      (
                        keyboardType: TextInputType.text,
                        //controller: _valor,
                        textAlignVertical: TextAlignVertical.center,
                        style: AppFonts.cardState,
                        textCapitalization: TextCapitalization.sentences,

                        decoration: InputDecoration
                        (
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 10),
                          suffixIcon: Icon
                          (
                            Icons.edit,
                            color: AppColors.secondary,
                          ),

                          border: UnderlineInputBorder
                          (
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: AppColors.formBackground,
                          hintText: 'Descrição'

                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Row
              (
                mainAxisAlignment: MainAxisAlignment.end,
                children: 
                [
                  TextButton
                  (
                    onPressed: () {
                      Navigator.of(context).pop();
                  }, 
                  style: ButtonStyle
                  (
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (
                      RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      )
                    )
                  ),
                  child: Text
                  (
                    'Cancelar',
                    style: AppFonts.dialogButton
                  )
                  ),

                  TextButton
                  (
                    onPressed: () {
                  }, 
                  style: ButtonStyle
                  (
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (
                      RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      )
                    )
                  ),
                  child: Text
                  (
                    'Salvar',
                    style: AppFonts.dialogButton
                  )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}