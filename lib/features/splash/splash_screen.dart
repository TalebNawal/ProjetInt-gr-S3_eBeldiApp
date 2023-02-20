import 'package:ebeldi/features/auth/screens/auth_screen.dart';
import 'package:ebeldi/features/splash/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../auth/services/auth_service.dart';
import '../invit/screens/invite_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final AuthService authService = AuthService();
  @override
  void dispose() {
    super.dispose();
  }

  void signInUser() {
    authService.signInUserInv(
      context: context,
      email: 'visiteur@gmail.com',
      password: '1234',
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget introButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(8),
              ),
              backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 255, 255, 255).withOpacity(0.4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            icon: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            label: Text(
              'Se connecter',
              style: h3Style.copyWith(color: Color.fromARGB(255, 3, 3, 3)),
            ),
          ),
        ),
      );
    }

    Widget inviteButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              signInUser();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InviteScreen()),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(8),
              ),
              backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 255, 255, 255).withOpacity(0.4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            icon: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            label: Text(
              'Découvrir',
              style: h3Style.copyWith(color: Color.fromARGB(255, 3, 3, 3)),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/introd2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Text(
                  'Les Trésors du Terroir Marocain',
                  style: h1Style.copyWith(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 5),
                Text(
                  'Retrouvez des produits du terroir certifiés et labellisés pour attester de leur qualité exceptionnelle',
                  style: h3Style.copyWith(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                Text(
                  'Connecter vous maintenant et Commander vous produits préfèrés',
                  style: h4Style.copyWith(
                      color: Color.fromARGB(255, 231, 224, 224)),
                ),
                const SizedBox(height: 20),
                introButton(),
                const SizedBox(height: 30),
                Text(
                  'Continuer en tant que visiteur ',
                  style: h4Style.copyWith(
                      color: Color.fromARGB(255, 231, 224, 224)),
                ),
                const SizedBox(height: 20),
                inviteButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
