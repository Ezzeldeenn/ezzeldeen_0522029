import 'package:ezzeldeen_0522029/Provider/Signup_provider.dart';
import 'package:ezzeldeen_0522029/Screen/Items_Screen.dart';
import 'package:ezzeldeen_0522029/Screen/Signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Login Page")),),
      body: Consumer<RegisteProvider>(builder: (context, value, child)
      {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(""),
                  radius: 50,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    suffix:Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    suffix: Icon(Icons.remove_red_eye_sharp),
                   labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 50,),
                OutlinedButton(
                  onPressed: () async {
                    bool login = await Provider.of<RegisteProvider>(context,listen: false).loginProvider(email.text, password.text);
                    if(login)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The Dta Correctly ")));
                    }
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have Account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    },
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}