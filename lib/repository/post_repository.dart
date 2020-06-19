import 'dart:async';
import 'dart:convert';
import 'package:bloc_post/models/user_created.dart';
import 'package:bloc_post/models/users.dart';
import 'package:http/http.dart';

class PostRepository {
  List<Users> list;
 
  Future<UserCreated> makePostRequest(String title, String postbody) async {
    String url = 'https://reqres.in/api/users';
    Map<String, String> headers = {"Content-type": "application/json"};
    String send_it =
        '{"name": "$title", "job": "$postbody"}'; // make POST request
    //String send_it = '{"title": "EE", "body": "ZZ", "userId": 12}';
    Response response = await post(url,
        headers: headers,
        body: send_it); // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    Map postMap = jsonDecode(body);
    var postREP = UserCreated.fromJson(postMap);
    return postREP;
  }

  Future<Users> requestUsers() async{
    String url = 'https://reqres.in/api/users' ;
    String headertype = "Content-type";
    String headerContent = "application/json";
    Map<String, String> headers = {headertype:headerContent};
    final response = await get(url,headers: headers);
    String body = response.body;
    Map postMap = jsonDecode(body);
    var postREP = Users.fromJson(postMap);
    return postREP;
  }
}
