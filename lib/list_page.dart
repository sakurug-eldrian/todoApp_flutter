import 'package:flutter/material.dart';
import 'add_page.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () async {
                final newListText = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TodoAddPage();
                  }),
                );
                if (newListText != null) {
                  setState(() {
                    todoList[index] = newListText;
                  });
                }
              },
              onLongPress: () {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(todoList[index]),
              ),
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}