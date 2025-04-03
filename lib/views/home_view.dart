import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_note_list_view.dart';

class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override

  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      context.read<NotesCubit>().fetchAllNotes(); // Call here instead
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
             // isScrollControlled: true,
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddNoteCubit(),
                  child: BlocConsumer<AddNoteCubit, AddNoteState>(
                    listener: (context, state) {
                      if (state is AddNoteFailure) {
                        print("fail ${state.errMessage}");
                      }
                      if (state is AddNoteSuccess) {
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return AbsorbPointer(
                        absorbing: state is AddNoteLoading ? true : false,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                          child: AddNoteForm(),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.greenAccent,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              CustomAppBar(appBarTitle: "Notes", icon: Icons.search),
              Expanded(child: CustomNoteListView()),
            ],
          ),
        ),
      );
    });
  }
}
