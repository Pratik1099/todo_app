import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
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
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'TO DO App',
              textAlign: TextAlign.center,
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
                  ),
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
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: tick,
                                onChanged: (value) {
                                  setState(() {
                                    this.tick = value!;
                                  });
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 20),
                                  child: _editmode
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
                                ),
                              ),
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
