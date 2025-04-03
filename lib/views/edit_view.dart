import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        children: [
          SizedBox(
            height: 16,
          ),
          CustomAppBar(
            appBarTitle: "Edit note",
            icon: Icons.check,
            onTap: () {
              widget.note.title =
                  title ?? widget.note.title; //if null remain the old value
              widget.note.subTitle = content ??
                  widget.note.subTitle; //if null remain the old value
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          CustomTextFormField(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          CustomTextFormField(
            hintText: widget.note.subTitle,
            maxLines: 7,
            onChanged: (value) {
              content = value;
            },
          ),
          SizedBox(height: 200),
          //  CustomButton(text: "Edit",onTab: (){
          //  Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeView()),
          //       (route) => false,
          //     );
          //  },),
        ],
      ),
    );
  }
}
