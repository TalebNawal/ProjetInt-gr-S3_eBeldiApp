import 'package:ebeldi/common/widgets/bottom_bar.dart';
import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/admin/screens/admin_screen.dart';
import 'package:ebeldi/features/auth/screens/auth_screen.dart';
import 'package:ebeldi/features/auth/services/auth_service.dart';
import 'package:ebeldi/features/home/screens/home_screen.dart';
import 'package:ebeldi/features/splash/splash_screen.dart';
import 'package:ebeldi/providers/user_provider.dart';
import 'package:ebeldi/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart'; //For creating the SMTP Server
import 'features/paiement/screens/paiement_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eBeldi ',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          useMaterial3: true, // can remove this line
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: IntroScreen(),
            title: new Text(
              'Bienvenue sur eBeldi',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white),
            ),
            // image: new Image.asset('assets/flut.png'),
            backgroundColor: const Color.fromARGB(255, 14, 54, 38),
            image: new Image.asset('assets/images/the.png'),
            photoSize: 100.0,
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Colors.white)
        /*Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),*/
        );
  }
}
