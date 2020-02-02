import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reports_app/ui/reports/googleSignApp.dart';
import 'package:reports_app/ui/reports/reportsList.dart';



class ProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
  final GoogleSignIn _gSignIn =  GoogleSignIn();

    return  Scaffold(
        appBar:  AppBar(
          title:  Text("ReportsApp"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: (){
               _gSignIn.signOut();
              print('Signed out');
               Navigator.pop(context);
             
            },
          ),
        ],
        ),
        body:Center(child: Column(
            children: <Widget>[
              SizedBox(height:40.0),
              CircleAvatar(
                backgroundImage:NetworkImage(detailsUser.photoUrl),
                radius: 50.0,
              ),
              SizedBox(height:50.0),
              Container(
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                      "Welcome " + detailsUser.userName + ",\nPress the button bellow to see the reports",
                      style:  TextStyle(fontSize: 18.0),
                    ),  
              ),
              SizedBox(height:50.0),
              Container(
                  width: 120.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    child:  RaisedButton(
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                        Text(
                          "See reports",
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],),
                      onPressed:  () {
                        Navigator.push(context,
                            _onPressed(context));
                      },
                    ),
                  ),
                    ),
              ),
            ],
          ),)
        );
  }

  _onPressed(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            ReportsList(title: 'Reports')   
        ),     
    );
  }

}