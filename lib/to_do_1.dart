import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDO1 extends StatefulWidget {
  @override
  _ToDO1State createState() => _ToDO1State();
}

class _ToDO1State extends State<ToDO1> {
  bool tick = false;
  bool _editmode = false;
  String input = "";
  final List<String> todos = <String>[];

  @override
  void initState() {
    super.initState();
    todos.add('item1');
    todos.add('item2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TO DO App',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Type Something Here',
                            ),
                            onChanged: (String value) {
                              setState(() {
                                input = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todos.add(input);
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Card(
                          key: ValueKey('this task'),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: tick,
                              onChanged: (value) {
                                setState(() {
                                  tick = value!;
                                });
                              },
                            ),
                            title: _editmode
                                ? TextField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'type here',
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        input = value;
                                      });
                                    },
                                    onSubmitted: (String input) {
                                      setState(() {
                                        todos[index] = input;
                                        _editmode = !_editmode;
                                      });
                                    },
                                  )
                                : Text(todos[index]),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _editmode = !_editmode;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
