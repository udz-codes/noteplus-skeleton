import 'package:flutter/material.dart';
import 'package:noteplus/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateSheet extends StatefulWidget {
  @override
  _CreateSheetState createState() => _CreateSheetState();
}

class _CreateSheetState extends State<CreateSheet> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  static String addNote = r"""
  mutation insertNote($title: String!, $body: String!) {
    insert_Notes_one(object: {title: $title,body: $body}) {
      title
      body
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GraphQLConsumer(
        builder: (GraphQLClient client){
          return Container(
            color: kSecondaryColor,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mutation
                Mutation(
                  options: MutationOptions(
                    document: gql(addNote),
                    onError: (error) => print(error?.graphqlErrors),
                    onCompleted: (dynamic resultdata) {
                      if(resultdata != null) {
                        client.resetStore();
                        Navigator.pop(context);
                      }
                    }
                  ),
                  builder: (RunMutation runMutation, QueryResult? result){
                    return Container(
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
                                  try {
                                    runMutation({
                                      "title": titleController.text,
                                      "body": bodyController.text
                                    });
                                  } catch (e) {
                                    print("Error: e");
                                  }
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
                    );
                  },
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
          );
        },
      ),
    );
  }
}