import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CrudSample extends StatefulWidget {
  @override
  CrudSampleState createState() {
    return CrudSampleState();
  }
}

class CrudSampleState extends State<CrudSample> {
  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document('myData/dummy');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final UserCredential authResult = await _auth.signInWithCredential(credential);
  User user = authResult.user;
  print("signed in " + user.displayName);
  return user;
}


  void _signOut() {
    googleSignIn.signOut();
    print('User Signed out');
  }

  void _add() {
    Map<String, String> data = <String, String>{
      'name': 'Neelesh Singh Thakur',
      'desc': 'Flutter Developer'
    };
    documentReference.setData(data).whenComplete(() {
      print('Document Added');
    }).catchError((dynamic e) => print(e));
  }

  void _delete() {
    documentReference.delete().whenComplete(() {
      print('Deleted Successfully');
      setState(() {});
    }).catchError((dynamic e) => print(e));
  }

  void _update() {
    Map<String, String> data = <String, String>{
      'name': 'Neelesh Singh Thakur Updated',
      'desc': 'Flutter Developer Updated',
    };
    documentReference.updateData(data).whenComplete(() {
      print('Document Updated');
    }).catchError((dynamic e) => print(e));
  }

  void _fetch() {
    documentReference.get().then((DocumentSnapshot datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = ('${datasnapshot.data()['desc']}');
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = ('${datasnapshot.data()['desc']}');
        });
      }
    });
  }

  @override
  void dispose() {
   
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Firebase Demo',
          style: TextStyle(
                fontSize: 27.0,
                 fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Colors.white,
              ),),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           RaisedButton(
              onPressed: () => _handleSignIn()
                  .then((User user) => print(user))
                  .catchError((dynamic e) => print(e)),
              child: const Text('Sign In'),
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _signOut,
              child: const Text('Sign out'),
              color: Colors.blueGrey,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _add,
              child: const Text('Add'),
              color: Colors.cyanAccent,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _update,
              child: const Text('Update'),
              color: Colors.greenAccent,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: _delete,
              child: new Text("Delete"),
              color: Colors.orangeAccent,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _fetch,
              child: new Text("Fetch"),
              color: Colors.limeAccent,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            if (myText == null) Container() else Text(
                    myText,
                    style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
