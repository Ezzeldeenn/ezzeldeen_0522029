import 'package:ezzeldeen_0522029/Provider/Signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("SignUp Page")),),
      body: Consumer<RegisteProvider>(builder: (context, value, child)
      {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    suffix:Icon(Icons.account_circle_rounded),
                    hintText: "Name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    suffix:Icon(Icons.phone),
                    hintText: "Phone Number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 20,),
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
                  controller: password,
                  decoration: InputDecoration(
                    suffix:Icon(Icons.remove_red_eye),
                    hintText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),obscureText:true,
                ),
                SizedBox(height: 50,),
                OutlinedButton(
                  onPressed: () async {
                    bool signup = await Provider.of<RegisteProvider>(context,listen: false).signupProvider(name.text, phone.text, email.text, password.text);
                    if(signup)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The Data Correctly ")));
                    }
                  },
                  child: Text("SignUp"),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text("Already have account"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                      child: Text("Login"),
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