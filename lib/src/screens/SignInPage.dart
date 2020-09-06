import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './SignUpPage.dart';
import './Dashboard.dart';
import '../shared/common.dart';
import '../shared/custom_text.dart';
import '../widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';




class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Image.asset("images/logo.png", width: 120, height: 120,),
                Text("Welcome back!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              ],
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
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
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
                  if(!await authProvider.signIn()){
                    _key.currentState.showSnackBar(
                        SnackBar(content: Text("Login failed!"))
                    );
                    return;
                  }
                  changeScreenReplacement(context, Dashboard());
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
                        CustomText(text: "Login", color: white, size: 22,)
                      ],
                    ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Forgot Password?",),
                ],
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
    //     title: Text('Sign In',
    //         style: TextStyle(
    //             color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
    //     actions: <Widget>[
    //       FlatButton(
    //         onPressed: () {
    //           // Navigator.of(context).pushReplacementNamed('/signup');
    //           Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft,  child: SignUpPage()));

    //         },
    //         child: Text('Sign Up', style: contrastText),
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
    //             Text('Welcome Back!', style: h3),
    //             Text('Howdy, let\'s authenticate', style: taglineText),
    //             fryoTextInput('Username'),
    //             fryoPasswordInput('Password'),
    //             FlatButton(
    //               onPressed: () {},
    //               child: Text('Forgot Password?', style: contrastTextBold),
    //             )
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
    //     height: 245,
        
    //     width: double.infinity,
    //     decoration: authPlateDecoration,
    //   ),
    //     ],
    //   )
    // );
  }
}
