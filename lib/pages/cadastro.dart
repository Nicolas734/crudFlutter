import 'package:atv_crud_flutter/components/button_custom.dart';
import 'package:atv_crud_flutter/components/input_field_custom.dart';
import 'package:atv_crud_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _Cadastro createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {
  late final TextEditingController _nome = TextEditingController();
  late final TextEditingController _preco = TextEditingController();
  late final TextEditingController _descricao = TextEditingController();
  late final TextEditingController _quantidade = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _descricao.dispose();
    _preco.dispose();
    _quantidade.dispose();
    super.dispose();
  }

  Future<void> cadastrarProduto() async {
    final nome = _nome.text;
    final descricao = _descricao.text;
    final preco = double.parse(_preco.text);
    final quantidade = double.parse(_quantidade.text);


    final http.Response response = await http.post(
      Uri.parse('https://loja-mcyhir2om-rodrigoribeiro027.vercel.app/produtos/criar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nome': nome,
        'descricao': descricao,
        'preco': preco,
        'quantidade':quantidade
      }),
    );

    if (response.statusCode == 201) {
          Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
    } else {
      print('Erro ao cadastrar produto: ${response.statusCode} - ${response.body}');
    }
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
                const SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Nome", controller: _nome),
                const SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Descricao", controller: _descricao),
                const SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Preço", controller: _preco),
                const SizedBox(height: 20, width: 20),
                InputFieldCustom(title: "Quantidade", controller: _quantidade),
                const SizedBox(height: 20, width: 20),
                ButtomCustom(function: cadastrarProduto, title: "Cadastrar",)
              ],
            )
          ],
        ),
      ),
    );
  }
}
