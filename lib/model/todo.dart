import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store {
  final String id = UniqueKey().toString();

  @observable
  String descricao = "";

  _ToDoStore(this.descricao);

  @action
  alterar(String descricao) {
    this.descricao = descricao;
  }
}
