import 'package:fbbrue/screens/auth/components/text_decoration.dart';
import 'package:flutter/material.dart';

class AuthPageSceen extends StatelessWidget {
  const AuthPageSceen({
    Key? key,
    required this.onchangeEmail,
    required this.onchangePassword,
    required this.ontapLogin,
    required this.btnText,required this.bottomText,required this.bottombtnText,required this.bottonmBtmTap,
  }) : super(key: key);


  final ValueChanged<String> onchangeEmail;
  final ValueChanged<String> onchangePassword;
  final Function ontapLogin;
  final String btnText;
  final String bottomText;
  final String bottombtnText;
  final Function bottonmBtmTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      padding:EdgeInsets.symmetric(vertical: 20,horizontal: 40) ,
      child: Padding(
        padding: EdgeInsets.only(top: size.height*0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/login_image.png',height: size.height*0.35,)
            ,Textdecoration(child: TextFormField(
              validator: (val)=> val!.isEmpty ? "enter value":null,
              onChanged: onchangeEmail,
              decoration: InputDecoration(
                icon: Icon(Icons.person,color: Colors.brown[400],),
                hintText: "Enter Email",

              ),

            ),),
            Textdecoration(child: TextFormField(
              validator: (val)=> val!.length<6?"Enter password 6+ char long":null,
              onChanged: onchangePassword,
              decoration: InputDecoration(
                icon: Icon(Icons.lock,color: Colors.brown[400],),
                hintText: "Enter Password",

              ),
              obscureText: true,


            ),),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width*0.8,
              height: size.height*0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.brown[400],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        spreadRadius: 4.0,
                        blurRadius: 10.0,
                        offset: Offset(5,5),
                        color: Colors.grey
                    )
                  ]
              ),
              child: FlatButton(
                onPressed: ()=>{ontapLogin()},
                child: Text(btnText,textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.brown[100]
                ),),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bottomText, style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w500,
                  color: Colors.brown[500]
                ),),
                GestureDetector(onTap: ()=>{bottonmBtmTap()},
                child:  Text(bottombtnText, style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.w700,
                    color: Colors.brown[700]
                ),),)
              ],
            )

          ],
        ),
      ),
    );
  }
}