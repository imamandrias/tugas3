import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HalamanLogin(),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "", password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Silahkan Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: "Masukan Username", icon: Icon(Icons.account_circle)),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukan Password", icon: Icon(Icons.lock)),
                ),
                SizedBox(height: 16.0,),
                Container(
                  color: Colors.cyan,
                  child: MaterialButton(
                    child: Text('Login'),
                    onPressed: (){
                      setState(() {
                        username = usernameController.text;
                        password = passwordController.text;
                        if(username=="admin" && password=="admin"){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>HomePage(username:username, password:password)
                          ));
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  String username, password;
  HomePage({this.username, this.password});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          Text('Selamat Datang di Halaman Home'),
          SizedBox(height: 8.0,),
          Text('Username : ${widget.username}'),
          Text('Password : ${widget.password}'),
          SizedBox(height: 16.0,),
          RaisedButton(
            child: Text("Logout"),
            color: Colors.lightBlue,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>HalamanLogin()
              ));
            },
          ),
        ],
      ),
    );
  }
}




