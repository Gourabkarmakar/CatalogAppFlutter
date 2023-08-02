import 'package:catalog_app/utils/myroutes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool processing = false;
  final _formKey = GlobalKey<FormState>();

  // Login Function
  loginFunc(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        processing = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.of(context).pushNamed(MyAppRoutes.homeRoute);

      // State Restart
      setState(() {
        processing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_img.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: Color.fromRGBO(108, 99, 255, 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can not be empty";
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "password",
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "password length must be more then 6 ";
                        } else if (value.isEmpty) {
                          return "password cannot be empty";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: const Color.fromRGBO(108, 99, 255, 1.0),
                      borderRadius: BorderRadius.circular(processing ? 50 : 8),
                      child: InkWell(
                        onTap: () => loginFunc(context),
                        child: AnimatedContainer(
                          height: 50,
                          width: processing ? 50 : 150,
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.center,
                          child: processing
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
