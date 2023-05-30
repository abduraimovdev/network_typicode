import 'dart:convert';


import '../models/todo_model.dart';
import '../models/user/user.dart';

abstract class Parser {
  static List<Todo> parseAllTodo(String data) {
    List json = jsonDecode(data);
    return json.map((map) => Todo.fromJson(map)).toList();
  }




  static List<User> parseAllUser(String data) {
    List json = jsonDecode(data);
    return json.map<User>((map) => User.fromJson(map)).toList();
  }
}