import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import '../utils/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              //svg image
              SvgPicture.asset(
                'assets/ic_instagram.svg', 
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64,),

              // ciculer widget to accept and show our selected file
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://eos.org/wp-content/uploads/2019/09/cumulus-clouds-blue-sky.jpg'),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  ),
                ],
              ),
              const SizedBox(height: 24,),

              //text field for username
              TextFieldInput(
                textEditingController: _usernameController, 
                hintText: 'Enter Your Username', 
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24,),

              //text field for email
              TextFieldInput(
                textEditingController: _emailController, 
                hintText: 'Enter Your Email', 
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24,),

              //text field for password
              TextFieldInput(
                textEditingController: _passwordController, 
                hintText: 'Enter Your Password', 
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24,),

              //text field for bio
              TextFieldInput(
                textEditingController: _bioController, 
                hintText: 'Enter Your Bio', 
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24,),

              //button login
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                  ),
                  child: const Text('Log in'),
                ),
              ),
              const SizedBox(height: 12,),

              Flexible(child: Container(), flex: 2,),

              // sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Have an account?"),

                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Log In",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}