import 'package:atv_crud_flutter/components/input_field_custom.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _Cadastro createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {
  late final TextEditingController _nome = TextEditingController();
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _senha = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text("Cadastro", style: TextStyle(fontSize: 25)),
            ),
            Column(
              children: [
                
                SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Nome", controller: _nome),
                SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Email", controller: _email),
                SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Senha", controller: _senha),
                SizedBox(height: 20, width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
