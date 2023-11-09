import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:prova_flutter_login/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'list_todo_store.g.dart';

class ListToDoStore = _ListToDoStore with _$ListToDoStore;

abstract class _ListToDoStore with Store {
  ObservableList<ToDoStore> toDos = ObservableList<ToDoStore>();

  @action
  Future<void> carregar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String todoListString = prefs.getString('todoList') ?? '';
    if (todoListString.isNotEmpty) {
      List<dynamic> todoListMap = jsonDecode(todoListString);
      for (String todoMap in todoListMap) {
        toDos.add(ToDoStore(todoMap));
      }
    }
  }

  @action
  Future<void>  adicionar(String descricao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toDos.add(ToDoStore(descricao));
    String todoListString =
        jsonEncode(toDos.map((todo) => todo.descricao).toList());
    await prefs.setString('todoList', todoListString);
  }

  @action
   Future<void> alterar(ToDoStore toDo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toDos.firstWhere((element) => element.id == toDo.id).alterar(toDo.descricao);
    String todoListString =
        jsonEncode(toDos.map((todo) => todo.descricao).toList());
    await prefs.setString('todoList', todoListString);
  }

  @action
   Future<void> excluir(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toDos.removeWhere((element) => element.id == id);
    String todoListString =
        jsonEncode(toDos.map((todo) => todo.descricao).toList());
    await prefs.setString('todoList', todoListString);
  }
}
