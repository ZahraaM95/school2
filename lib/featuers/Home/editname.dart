
import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/auth/view/custom_text.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme:const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
                  ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                const SizedBox(height: 40,),
                CustomTextForm( 
                  mycontroller: null,
                  hinttext:'الاسم' ,
                  svg:'assets/svg/user.svg' ,
                ),
              //  const SizedBox(height: 10,),
                CustomButtomAuth(text: 'حفظ',
               onPressed: (){},)

              ],
            ),
          ),
        ),
      ),
    );
  }
}