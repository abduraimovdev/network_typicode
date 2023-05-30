import 'package:network_typicode/models/user/user.dart';
import 'package:network_typicode/parser/typicode_parser.dart';
import 'package:network_typicode/service/apis.dart';
import 'package:network_typicode/service/network_service.dart';

void userPage() {
  getData();
}


void getData() async{
  final response = await network.get(TypiCodeApi.typicodeUrl, TypiCodeApi.users.path);
  List<User> users = Parser.parseAllUser(response);
  print(users[0].email);
}