import 'dart:convert';

import 'package:network_typicode/parser/typicode_parser.dart';
import 'package:network_typicode/service/apis.dart';
import 'package:network_typicode/service/network_service.dart';

import '../models/todo_model.dart';

void todo() {
  getData();
}

void getData() async {
  final response = await network.get(TypiCodeApi.typicodeUrl, TypiCodeApi.todos.path);
  List<Todo> data = Parser.parseAllTodo(response);
}