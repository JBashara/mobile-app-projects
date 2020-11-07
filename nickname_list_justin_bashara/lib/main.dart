import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Justin Bashara
// This project allows a user to enter a name and save it to a list.

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nickname List',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('NickName List'),
        ),
        body: ListPage(),
        ),
      );
  }
}

class NameCard extends StatelessWidget {
  final String name;

  NameCard(this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 30,
            child: Text(name),
          ),
        ],
      )

    );
  }
}

class NameList extends StatelessWidget {
  final List<String> names;

  NameList(this.names);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var name in names) NameCard(name)
      ],
    );
  }
}

class NameForm extends StatelessWidget {
  final Function saveAction;
  final _formKey = GlobalKey<FormState>();
  NameForm({this.saveAction});
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
          color: Colors.black12,
          margin: EdgeInsets.only(top: 40, left: 40, right: 40),
          child: TextFormField(
            controller: TextEditingController(),
            onSaved: saveAction,
            validator: (value) {
              if (value == "")
                return "Enter text";
              else
                return null;
            },
          ),
        ),
        RaisedButton(
          color: Colors.purple,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
          },
          child: Text(
              'Save name',
              style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  List<String> names;

  ListPageState(){
    names = List<String>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded (
          flex: 4,
          child: NameList(names),
        ),
        Expanded (
          flex: 2,
          child: NameForm(
              saveAction: addToList,
          ),
        ),
      ],
    );
  }

  addToList(String name){
    setState(() {
      names.add(name);
    });
  }

}
