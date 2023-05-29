import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/remote/dio_helper.dart';
import 'package:newsapp/widgets/constants/bloc_observer.dart';
import 'package:newsapp/widgets/widgets/componants.dart';

import 'cubit/app_Cubit.dart';
import 'cubit/app_States.dart';
import 'layout/news_app/news_layout.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _saveCredentials(String username, String password) {
    _prefs.setString('username', username);
    _prefs.setString('password', password);
  }

  bool _validateCredentials(String username, String password) {
    final savedUsername = _prefs.getString('username');
    final savedPassword = _prefs.getString('password');
    return username == savedUsername && password == savedPassword;
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (_validateCredentials(username, password)) {
        _saveCredentials(username, password);
        navigateTo(context, NewsScreen());
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















// void main() {
//   runApp(const MyApp());
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//
//  // NewsCubit()..getBusiness()
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => NewsCubit()..getBusiness(),),
//       ],
//       child: BlocConsumer<NewsCubit, NewsStates>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.green,
//               scaffoldBackgroundColor: Colors.grey.shade50,
//               appBarTheme: const AppBarTheme(
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                   statusBarBrightness: Brightness.dark,
//                   statusBarColor: Colors.grey,
//                 ),
//                 backgroundColor: Colors.white,
//                 elevation: 8,
//                 titleTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//                 selectedItemColor: Colors.green,
//                 elevation: 30,
//               ),
//             ),
//             debugShowCheckedModeBanner: false,
//             home: NewsScreen(),
//           );
//         },
//       ),
//     );
//
//   }
// }


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
