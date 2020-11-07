//import 'dart:ui';

import 'package:flutter/material.dart';

final appTitle = 'Emotion Picker';

void main() {
  runApp(MaterialApp(
    title: appTitle,
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(title: 'Emotion Picker'),
      '/happy': (context) => Happy(),
      '/angry': (context) => Angry(),
      '/sad': (context) => Sad(),
      '/scared': (context) => Scared(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emotion Picker.')),
      body: Center(child: Text('Pick an emotion')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Pick an Emotion'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Happy'),
              onTap: () {
                Navigator.pushNamed(context, '/happy');
              },
            ),
            ListTile(
              title: Text('Sad'),
              onTap: () {
                Navigator.pushNamed(context, '/sad');
              },
            ),
            ListTile(
              title: Text('Angry'),
              onTap: () {
                Navigator.pushNamed(context, '/angry');
              },
            ),
            ListTile(
              title: Text('Scared'),
              onTap: () {
                Navigator.pushNamed(context, '/scared');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Happy extends StatelessWidget {
  final String title = 'Happy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/happy.jpg', height: 100, width: 100,fit: BoxFit.contain),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title),
                        Text('Feeling $title'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class Angry extends StatelessWidget {
  final String title = 'Angry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/angry.jfif', height: 100, width: 100,fit: BoxFit.contain),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title),
                        Text('Feeling $title'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class Sad extends StatelessWidget {
  final String title = 'Sad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/sad.jpg', height: 100, width: 100,fit: BoxFit.contain),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title),
                        Text('Feeling $title'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class Scared extends StatelessWidget {
  final String title = 'Scared';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/scared.jfif', height: 100, width: 100,fit: BoxFit.contain),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title),
                        Text('Feeling $title'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
