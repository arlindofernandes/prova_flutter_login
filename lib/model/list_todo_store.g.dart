// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListToDoStore on _ListToDoStore, Store {
  late final _$carregarAsyncAction =
      AsyncAction('_ListToDoStore.carregar', context: context);

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$adicionarAsyncAction =
      AsyncAction('_ListToDoStore.adicionar', context: context);

  @override
  Future<void> adicionar(String descricao) {
    return _$adicionarAsyncAction.run(() => super.adicionar(descricao));
  }

  late final _$alterarAsyncAction =
      AsyncAction('_ListToDoStore.alterar', context: context);

  @override
  Future<void> alterar(ToDoStore toDo) {
    return _$alterarAsyncAction.run(() => super.alterar(toDo));
  }

  late final _$excluirAsyncAction =
      AsyncAction('_ListToDoStore.excluir', context: context);

  @override
  Future<void> excluir(String id) {
    return _$excluirAsyncAction.run(() => super.excluir(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
