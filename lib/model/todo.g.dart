// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoStore on _ToDoStore, Store {
  late final _$descricaoAtom =
      Atom(name: '_ToDoStore.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$_ToDoStoreActionController =
      ActionController(name: '_ToDoStore', context: context);

  @override
  dynamic alterar(String descricao) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.alterar');
    try {
      return super.alterar(descricao);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descricao: ${descricao}
    ''';
  }
}
