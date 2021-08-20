import 'package:flutter/material.dart';
import 'package:noteplus/noteApp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Creating link for our client
  static HttpLink httpLink = new HttpLink(
    'https://noteplus.hasura.app/v1/graphql', // Api Endpoint
    defaultHeaders: {                         // Passing Headers
      'x-hasura-admin-secret': ''
    }
  );

  // Creating client for graphql provider
  static ValueNotifier<GraphQLClient> myClient = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache (
        store: InMemoryStore() // Store to keep our cache
      ),
      link: httpLink
    )
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: myClient,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: NoteApp(),
      ),
    );
  }
}