import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        children: [
          SizedBox(height: 16,),
          CustomAppBar(appBarTitle: "Edit note", icon: Icons.check),
           CustomTextFormField(hintText: "Title", onSaved:(value ) {  },),
           CustomTextFormField(hintText: "Description", maxLines: 7, onSaved: (value ) {  },),
           SizedBox(height:200),
            //  CustomButton(text: "Edit",onTab: (){
            //  Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (context) => HomeView()),
            //       (route) => false,
            //     );
            //  },),
        ],
      ) ,
    );
  }
}