import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: TextFormField(
            onSaved: (pin1){

            },
            onChanged: (value){
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: const InputDecoration(hintText: '0',),
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],

          ),

        ),
        SizedBox(
          height: 68,
          width: 64,
          child: TextFormField(
            onSaved: (pin2){
              
            },
            onChanged: (value){
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: const InputDecoration(hintText: '0'),
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],

          ),

        ),SizedBox(
          height: 68,
          width: 64,
          child: TextFormField(
            onSaved: (pin3){
              
            },
            onChanged: (value){
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }

            },
            decoration: const InputDecoration(hintText: '0'),
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],

          ),

        ),
        SizedBox(
          height: 68,
          width: 64,
          child: TextFormField(
            onSaved: (pin4){
              
            },
            onChanged: (value){
              if(value.length == 1){
                FocusScope.of(context).nextFocus();
              }

            },
            decoration: const InputDecoration(hintText: '0'),
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],

          ),

        ),
        
      ],
    ));
  }
}