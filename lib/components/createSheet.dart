import 'package:flutter/material.dart';
import 'package:noteplus/constants.dart';

class CreateSheet extends StatefulWidget {
  @override
  _CreateSheetState createState() => _CreateSheetState();
}

class _CreateSheetState extends State<CreateSheet> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kSecondaryColor,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Note',
                        style: kHeadingStyle.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          )      
                        ),
                        onPressed: (){
                          print(titleController.text);
                          print(bodyController.text);
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: kSecondaryColor,
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: titleController,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: kPrimaryColor),
                    autofocus: true,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Title...',
                    ),
                  ),
                ],
              ),
            ),  
            Container(
              height: 200,
              child: TextField(
                controller: bodyController,
                expands: true,
                maxLines: null,
                textInputAction: TextInputAction.done,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                cursorColor: kPrimaryColor,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
                decoration: kBodyFieldDecoration.copyWith(
                  hintText: 'body...',
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}