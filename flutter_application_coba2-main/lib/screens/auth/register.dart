import 'package:flutter/material.dart';
import 'package:my_app/components/button.dart';
import 'package:my_app/components/textField.dart';
// import 'package:my_app/screens/auth/login.dart';
import 'package:my_app/services/auth_service.dart';
import '../layout.dart';
import 'package:my_app/components/sidebar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signUserUp() async {
    print(emailController.text);
    authService.signUpUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  bool _isObscured = true;

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SidebarComponent(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Image(
                  image: AssetImage('assets/images/register.png'),
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                      controller: passwordController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: _toggleObscureText,
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 0),
                Button(
                  onTap: signUserUp,
                  textData: 'Sign Up',
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 315,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LayoutPage(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Color.fromARGB(255, 223, 15, 15),
                      ),
                      child: Text(
                        'Back to main page',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Already have an account?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(width: 4),
                //     // TextButton(
                //     //   onPressed: () {
                //     //     Navigator.push(
                //     //         context,
                //     //         MaterialPageRoute(
                //     //           builder: (context) => LoginPage(),
                //     //         ));
                //     //   },
                //     //   child: const Text('Login'),
                //     // )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
