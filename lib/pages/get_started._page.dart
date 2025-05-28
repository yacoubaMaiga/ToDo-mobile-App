import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  loginButton() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get Started",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Create task"),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 6),
                  SizedBox(width: 10),
                  Text("Set reminders"),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 6),
                  SizedBox(width: 10),
                  Text("Track progress"),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/getstarted.png'),
                ),
              ),
            ),

            Spacer(),
            Column(
              children: [
                InkWell(
                  onTap: () => loginButton(),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF8A82C3),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                InkWell(
                  onTap: () => signUp(),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF8A82C3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
