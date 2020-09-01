import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
        children: <Widget>[
          DrawerHeader(
           decoration: BoxDecoration(
             gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.orangeAccent,
              ]
            )
          ),


          child: Container(
            child: Column(
              children: <Widget>[
                Material(

                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10,
                  child: Padding(padding: EdgeInsets.all(0.4),
                  child: Image.asset('images/6.jpg',width: 80,height: 80,),),
                ),
                Padding(padding: EdgeInsets.all(10.0),
                child: Text(
              'Singhs_Duos',
            style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
              ),),
            ),
              
              
              ],
            ),
          ),
           
        ),
         
         
           Container( 
         child: InkWell( 
           splashColor: Colors.orangeAccent,
            onTap: (){},
         child: Container(
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              
              title: Text(
                '+91-962 XXX 1678',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
         ),
        ),      decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.grey.shade400))
            ),
          ),
          



         Container( 
         child: InkWell( 
           splashColor: Colors.orangeAccent,
            onTap: (){},
         child: Container(
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
              
              title: Text(
                'singhs.duos@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
         ),
        ),      decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.grey.shade400))
            ),
          ),
          
          
           Container( 
         child: InkWell( 
           splashColor: Colors.orangeAccent,
            onTap: (){},
         child: Container(
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
         ),
        ),      decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.grey.shade400))
            ),
          ),
          
          Container( 
         child: InkWell( 
           splashColor: Colors.orangeAccent,
            onTap: (){},
         child: Container(
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
         ),
        ),      decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.grey.shade400))
            ),
          ),
          

          
        ],
      ),
    );
  }
}
