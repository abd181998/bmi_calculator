import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/modules/bmi/bimScreen.dart';

import '../../shared/componets/componets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emilController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(

            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                 
                  TextFormField(
                    controller: emilController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (valu) {
                      print(valu);
                    },
                    onChanged: (valu) {
                      print(valu);
                    },
                    validator: (valu){
                      if(valu == null || valu.isEmpty){
                        return 'email address must not empty';}
                        return null;

                    },
                    decoration: InputDecoration(
                        labelText: 'Emil Address',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPasswordShow,
                    onFieldSubmitted: (valu) {
                      print(valu);
                    },
                    onChanged: (valu) {
                      print(valu);
                    },
                    validator: (valu){
                      if(valu == null || valu.isEmpty){
                        return 'password must not empty';
                      }
                      return null;
                    },

                    decoration:  InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),

                        suffixIcon: IconButton(
                          icon:Icon(isPasswordShow? Icons.visibility_off: Icons.visibility),

                          onPressed: (){
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                        ),

                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultBotton(
                    text: 'login',
                    background: Colors.cyan,
                    isUpperCase: true,
                    Function: () {
                      if (formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BmiScreen()));
                        print(emilController.text);
                        print(passwordController.text);
                      }
                    }
                   ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account '),
                      SizedBox(width: 10),
                      TextButton(onPressed: () {}, child: Text('Register Now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
