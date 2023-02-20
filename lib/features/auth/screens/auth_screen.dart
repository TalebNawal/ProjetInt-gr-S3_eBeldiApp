import 'package:ebeldi/common/widgets/custom_textfield.dart';
import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 82, 7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 240, 233, 142),
                      const Color.fromARGB(255, 252, 245, 182).withOpacity(0.1)
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'eBeldi',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 70, 2),
                    ),
                  ),
                ),
              ),
              Container(height: 70),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Creer un compte',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 77, 72, 2)),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          controller: _nameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Nom Complet'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: false,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          controller: _emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email Professionnel'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: ' mot de passe'),
                        ),
                        Container(height: 21),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Inscription',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              Container(height: 20),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Se connecter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          controller: _emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email Professionnel'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: '    mot de passe'),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Se connecter',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
