import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/login/login_bloc.dart';
import 'package:flutter_application_1/model/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인")),
      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("로그인 페이지"),
                const SizedBox(height: 20),
                TextFormField(
                  controller: idController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "아이디",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "비밀번호",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<LoginBloc>(context).add(Login(LoginReqModel(
                        id: int.parse(idController.text),
                        password: passwordController.text)));
                    if (state is LoginSuccess) {
                      Navigator.of(context).pushNamed("/user");
                    } else {
                      print("error");
                    }
                  },
                  child: const Text("로그인"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
