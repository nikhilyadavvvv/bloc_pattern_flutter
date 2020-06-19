import 'package:bloc_post/bloc/jsonpost_bloc.dart';
import 'package:bloc_post/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildUserList(BuildContext context, Users users) {
    List<Data> list = users.data;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.network(list[index].avatar),
                Text("Name:" + list[index].firstName),
                Text("Last_Name:" + list[index].lastName),
                Text("email:" + list[index].email),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildUsers(BuildContext context, Users users) {
    return Stack(
      children: <Widget>[
        
        buildUserList(context, users),
        FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => resetUI(context),
        ),
      ],
    );
  }

    void resetUI(BuildContext context) {
    final jsonpostBloc = BlocProvider.of<JsonpostBloc>(context);
    jsonpostBloc.add(ResetUI());
  }