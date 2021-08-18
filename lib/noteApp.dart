import 'package:flutter/material.dart';
import 'package:noteplus/constants.dart';
import 'package:noteplus/notesArea.dart';
import 'package:noteplus/components/createSheet.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Center(
          child: Text(
            'Note Plus',
            style: kHeadingStyle,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        child: Icon(
          Icons.add,
          size: 35,
          color: kPrimaryColor,
        ),
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => CreateSheet()
          );
        },
      ),
      body: NotesArea(),
    );
  }
}