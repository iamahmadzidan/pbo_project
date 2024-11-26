import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF099AF5),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/undraw_Login_re_4vu2.png',
                width: screenWidth * 0.7,
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Sign in to your account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24.0),
              _buildTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                isPassword: false,
              ),
              const SizedBox(height: 16.0),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                isPassword: true,
              ),
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: _login,
                child: Container(
                  width: screenWidth * 0.85,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3DABF0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  // Logika untuk sign in dengan Google
                },
                child: Container(
                  width: screenWidth * 0.85,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hintText,
      required bool isPassword}) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDFDFDF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
