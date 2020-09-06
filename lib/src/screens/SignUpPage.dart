import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './SignInPage.dart';
import './Dashboard.dart';
import '../shared/common.dart';
import '../shared/custom_text.dart';
import '../db/auth.dart';
import '../provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../db/users.dart';
import '../widgets/loading.dart';


class SignUpPage extends StatefulWidget {
  final String pageTitle;

  SignUpPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
        return Scaffold(
      key: _key,
      backgroundColor: white,
      body:authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text("Hello there!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        icon: Icon(Icons.person)
                    ),
                  ),),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Emails",
                        icon: Icon(Icons.email)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: ()async{
                  print("BTN CLICKED!!!!");
                  if(!await authProvider.signUp()){
                  _key.currentState.showSnackBar(
                  SnackBar(content: Text("Resgistration failed!"))
                  );
                  return;
                  }

                  changeScreenReplacement(context, SignInPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: black,
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: "Continue", color: white, size: 22,)
                      ],
                    ),),
                ),
              ),
            ),




          ],
        ),
      ),
    );







    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: white,
    //     title: Text('Sign Up',
    //         style: TextStyle(
    //             color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
    //     actions: <Widget>[
    //       FlatButton(
    //         onPressed: () {
    //           // Navigator.of(context).pushReplacementNamed('/signin');
    //           Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: SignInPage()));

    //         },
    //         child: Text('Sign In', style: contrastText),
    //       )
    //     ],
    //   ),
    //   body: ListView(
    //     shrinkWrap: true,
    //     children: <Widget>[
    //       Container(
    //     padding: EdgeInsets.only(left: 18, right: 18),
    //     child: Stack(
    //       children: <Widget>[
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text('Welcome to Fryo!', style: h3),
    //             Text('Let\'s get started', style: taglineText),
    //             fryoTextInput('Username'),
    //             fryoTextInput('Full Name'),
    //             fryoEmailInput('Email Address'),
    //             fryoPasswordInput('Password')
    //           ],
    //         ),
    //         Positioned(
    //           bottom: 15,
    //           right: -15,
    //           child: FlatButton(
    //             onPressed: () {
    //                 Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Dashboard()));
    //             },
    //             color: primaryColor,
    //             padding: EdgeInsets.all(13),
    //            shape: CircleBorder(),
    //             child: Icon(Icons.arrow_forward, color: white),
    //           ),
    //         )
    //       ],
    //     ),
    //     height: 360,
        
    //     width: double.infinity,
    //     decoration: authPlateDecoration,
    //   ),
    //     ],
    //   )
    // );
  }
}
