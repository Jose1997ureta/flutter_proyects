import 'package:flutter/material.dart';
import 'package:flutter_proyects/presentation/pages/auth/function/validate_login.dart';
import 'package:flutter_proyects/presentation/widget/controles/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void handleSubmit() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            children: [
              Text("email: ${_emailController.text}"),
              Text('password: ${_passwordController.text}'),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputField(
                              label: "Ingrese su correo",
                              controller: _emailController,
                              validator: ValidateLogin.email,
                              prefixIcon: Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),
                            InputField(
                              label: "Ingrese su password",
                              controller: _passwordController,
                              validator: ValidateLogin.password,
                              prefixIcon: Icon(Icons.key_off_outlined),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            SizedBox(height: 40),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: FilledButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        colors.primary)),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          handleSubmit();
                                        }
                                      },
                                child: isLoading
                                    ? Text("Cargando ...")
                                    : Text("Ingresar"),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
