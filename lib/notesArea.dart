import 'package:flutter/material.dart';
import 'package:noteplus/constants.dart';
import 'package:animations/animations.dart';

class NotesArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Center(child: Text('Check code to add list'),)
        // child: ListView.builder(
        //   itemCount: ,
        //   itemBuilder: (context, index){
        //     return NoteTile(
        //       title: ,
        //       body: ,
        //     );
        //   }
        // ),
      ),
    );
  }
}

class NoteTile extends StatelessWidget {
  final title;
  final body;

  const NoteTile({ this.title, this.body });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: OpenContainer(
        closedColor: kPrimaryAccentColor,
        openColor: kPrimaryAccentColor,
        middleColor: kPrimaryAccentColor,
        transitionDuration: Duration(milliseconds: 400),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) {
          return ClosedNoteWidget(
            title: title,
            body: body,
          );
        },
        openBuilder: (context, action) {
          return OpenNoteWidget(
            title: title,
            body: body,
          );
        },
      ),
    );
  }
}

class ClosedNoteWidget extends StatelessWidget {
  final title;
  final body;

  const ClosedNoteWidget({ this.title, this.body });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Text(title, style: TextStyle(
              color: kSecondaryAccentColor,
              fontSize: 20
            ),),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: Text(
              body, 
              maxLines: 2,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OpenNoteWidget extends StatelessWidget {
  final title;
  final body;

  const OpenNoteWidget({ this.title, this.body });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(title, style: TextStyle(
                      color: kSecondaryAccentColor,
                      fontSize: 20
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    child: Text(
                      body,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onVerticalDragStart: (DragStartDetails details){
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: kSecondaryColor,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}