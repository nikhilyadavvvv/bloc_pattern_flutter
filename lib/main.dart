import 'package:bloc_post/repository/post_repository.dart';
import 'package:bloc_post/screens/post_maker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/jsonpost_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => JsonpostBloc(PostRepository()),
        child: PostMaker(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
