import 'package:flutter/material.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import './src/screens/OnBoardingPage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fryo/src/provider/app_provider.dart';
import './src//provider/product_provider.dart';
import './src//widgets/loading.dart';
import 'package:provider/provider.dart';
import './src/provider/user_provider.dart';
import './src/provider/category_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coin',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController(),
        routes: <String, WidgetBuilder>{
          '/onBoarding': (BuildContext context) => OnBoardingPage(),
          // '/homePage': (BuildContext context) => HomePage(pageTitle: 'Welcome'),
          '/signup': (BuildContext context) => SignUpPage(),
          '/signin': (BuildContext context) => SignInPage(),
          '/dashboard': (BuildContext context) => Dashboard(),
          '/productPage': (BuildContext context) => ProductPage(),
        },
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return SignInPage();
      case Status.Authenticated:
        return SplashScreen();
      default:
        return SignUpPage();
    }
  }
}






//void main() => runApp(MyApp());
//
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
//    );
//    return MaterialApp(
//      title: 'Coin',
//      theme: ThemeData(
//        primarySwatch: Colors.grey,
//      ),
//      // home: HomePage(pageTitle: 'Welcome'),
//      home: SplashScreen(),
//      debugShowCheckedModeBanner: false,
//      routes: <String, WidgetBuilder>{
//        '/onBoarding': (BuildContext context) => OnBoardingPage(),
//        // '/homePage': (BuildContext context) => HomePage(pageTitle: 'Welcome'),
//        '/signup': (BuildContext context) => SignUpPage(),
//        '/signin': (BuildContext context) => SignInPage(),
//        '/dashboard': (BuildContext context) => Dashboard(),
//        '/productPage': (BuildContext context) => ProductPage(),
//      },
//    );
//
//  }
//}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/onBoarding');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/coin.png', width: 190, height: 190),
      ),
    );
  }
}
