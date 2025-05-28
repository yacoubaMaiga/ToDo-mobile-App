import 'package:flutter/material.dart';
import 'package:todoapp/widgets/save_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Center(child: Text("Login to your account"))),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email"),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'youremail@gmail.com',
                  ),
                ),

                SizedBox(height: 20),

                Text("Password"),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),

                SizedBox(height: 40),
                SaveButton(buttonText: "Login", buttonOnPressed: () => login()),
                SizedBox(height: 40),
                // Spacer(),
                Column(
                  children: [
                    Center(child: Text('Or login with')),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/facebookLogo.png'),
                          height: 50,
                        ),
                        SizedBox(width: 30),
                        Image(
                          image: AssetImage('assets/images/appleLogo.png'),
                          height: 50,
                        ),
                        SizedBox(width: 30),
                        Image(
                          image: AssetImage('assets/images/googleLogo.png'),
                          height: 50,
                        ),
                      ],
                    ),

                    SizedBox(height: 60),

                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?'),
                          SizedBox(width: 5),
                          Text(
                            'Sign up',
                            style: TextStyle(color: Color(0xFF8A82C3)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
