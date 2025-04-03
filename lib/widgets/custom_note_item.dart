import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class CustomNoteItem extends StatelessWidget {

  const CustomNoteItem({super.key,required this.note});
    final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditView(),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.only(left: 15, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              subtitle: Text(
                note.subTitle,
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
              trailing: Icon(Icons.delete, color: Colors.black, size: 24),
            ),
            
            Padding(
              padding: const EdgeInsets.only(right:7 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  SizedBox(width: 90,),
                   Text(
                  note.date,
                  style: TextStyle(fontSize: 13, color: Colors.black38,),
                )],
              ),
            )
          ],
        ),
      ),
    );
  }
}
