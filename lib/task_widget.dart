import 'package:flutter/material.dart';
import 'package:todo_app/to_do_1.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
