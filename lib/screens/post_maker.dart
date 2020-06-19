import 'package:bloc_post/bloc/jsonpost_bloc.dart';
import 'package:bloc_post/models/user_created.dart';
import 'package:bloc_post/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Container(
          child: BlocBuilder<JsonpostBloc, JsonpostState>(
            builder: (context, state) {
              if (state is JsonpostInitial) {
                return buildFormPage(context);
              } else if (state is JsonpostLoading) {
                return buildLoading();
              } else if (state is JsonpostLoaded) {
                return buildNewData(context, state.userCreated);
              } else if (state is UsersLoaded) {
                return buildUsers(context, state.users);
              }
            },
          ),
        ),
      ),
    );
  }

  final title = TextEditingController();
  final body = TextEditingController();
  Widget buildFormPage(BuildContext context) {
    return Column(
      children: <Widget>[
        form_fields(context),
        form_submit(context),
      ],
    );
  }

  Widget buildNewData(BuildContext context, UserCreated userCreated) {
    return Column(
      children: <Widget>[
        Text(userCreated.name),
        SizedBox(
          height: 10,
        ),
        Text(userCreated.job),
        SizedBox(
          height: 10,
        ),
        Text(userCreated.createdAt.toString()),
        SizedBox(
          height: 10,
        ),
        form_fields(context),
        form_submit(context),
      ],
    );
  }

  Widget buildLoading() {
    return CircularProgressIndicator();
  }

  Widget form_fields(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: title,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Name of the Employee'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: body,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Job of the employee'),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget form_submit(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => submitData(context),
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          child: Icon(Icons.contacts),
          onPressed: () => getAllUsers(context),
        ),
      ],
    );
  }

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

  void submitData(BuildContext context) {
    final jsonpostBloc = BlocProvider.of<JsonpostBloc>(context);
    jsonpostBloc.add(GetPost(body.text, title.text));
  }

  void getAllUsers(BuildContext context) {
    final jsonpostBloc = BlocProvider.of<JsonpostBloc>(context);
    jsonpostBloc.add(GetUsers());
  }

  void resetUI(BuildContext context) {
    final jsonpostBloc = BlocProvider.of<JsonpostBloc>(context);
    jsonpostBloc.add(ResetUI());
  }
}
