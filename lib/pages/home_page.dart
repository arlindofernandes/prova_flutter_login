import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter_login/model/list_todo_store.dart';
import 'package:prova_flutter_login/model/todo.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FocusNode _focusNode = FocusNode();
  ToDoStore editToDo = ToDoStore("");
  bool edit = false;
  var descricaoController = TextEditingController();

  var listToDoStore = ListToDoStore();

  @override
  void initState() {
    super.initState();
    listToDoStore.carregar();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1b4e66),
                Color(0xFF2c958f),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                // color: Colors.white,
                child: Card(child: Observer(builder: (context) {
                  return ListView.builder(
                    itemCount: listToDoStore.toDos.length,
                    itemBuilder: (context, index) {
                      var toDo = listToDoStore.toDos[index];
                      return Observer(builder: (context) {
                        return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            height: 50,
                            child: Card(
                              elevation: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(toDo.descricao,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      edit = true;
                                      editToDo = toDo;
                                      descricaoController.text = toDo.descricao;
                                    },
                                    child: const Icon(Icons.border_color),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Excluir'),
                                              content: const Text(
                                                  'Tem certeza que deseja excluir?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    listToDoStore
                                                        .excluir(toDo.id);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Excluir',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ));
                      });
                    },
                  );
                })),
              )),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 40,
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  focusNode: _focusNode,
                  controller: descricaoController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: "Digite Seu Texto",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onSubmitted: (text) {
                    if (descricaoController.text.isNotEmpty) {
                      if (edit) {
                        editToDo.alterar(descricaoController.text);
                        listToDoStore.alterar(editToDo);
                        descricaoController.text = '';
                        edit = false;
                      } else {
                        listToDoStore.adicionar(descricaoController.text);
                        descricaoController.text = '';
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'o campo estar vazio, digite algo por favor'),
                          behavior: SnackBarBehavior.fixed,
                        ),
                      );
                    }
                    _focusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://google.com.br'));
                    },
                    child: const Text(
                      "Politica de Privacidade",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
