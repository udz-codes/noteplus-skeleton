import 'package:flutter/material.dart';
import 'package:noteplus/constants.dart';
import 'package:animations/animations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NotesArea extends StatelessWidget {

  static String getNotes = r"""
  query GetNotes{
    Notes {
      title
      body
    }
  }
  """; 

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Query(
        options: QueryOptions(
          document: gql(getNotes)
        ),
        builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore,}){

          if(result.isLoading) {
            return Center(child: Text('Loading...', style: TextStyle(color: kSecondaryAccentColor),));
          }

          if(result.hasException) {
            return Center(child: Text('Exception!!', style: TextStyle(color: Colors.red),));
          }

          List notes = result.data?["Notes"];

          int len = notes.length;
          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: notes.length == 0 ? 
              ListView(
                padding: EdgeInsets.only(left: 15, right: 15),
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 300),
                    child: Center(
                      child: Text('No notes yet :(', style: TextStyle(color: kSecondaryAccentColor),)
                    ),
                  )
                ]
              )
            : Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: len,
                itemBuilder: (context, index){
                  return NoteTile(
                    title: notes[(len-1) - index]["title"],
                    body: notes[(len-1) - index]["body"],
                  );
                }
              ),
            ),
          );
        }
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