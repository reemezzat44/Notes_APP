import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

//1-adding form
//2-validate input
//3-access database

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30),
            CustomTextFormField(
              hintText: "Title",
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 7),
            CustomTextFormField(
              hintText: "Description",
              maxLines: 6,
              onSaved: (value) {
                subTitle = value;
              },
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  text: "Add",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currantDate = DateTime.now();
                      var formattedCurrantDate =
                          DateFormat.yMd().format(currantDate);
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date:formattedCurrantDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  isLoading: state is AddNoteLoading ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
