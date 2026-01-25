import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/history_page.dart';
import 'package:imc_calculator/model/history_sqlite_model.dart';
import 'package:imc_calculator/repository/history_sqlite_repository.dart';
import 'package:imc_calculator/service/calcular_imc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImcCalculation extends StatefulWidget {
  const ImcCalculation({super.key});

  @override
  State<ImcCalculation> createState() => _ImcCalculationState();
}

class _ImcCalculationState extends State<ImcCalculation> {
  var calcularIMC = CalcularImc();
  var resultado = "";
  var peso = TextEditingController();
  var altura = TextEditingController();
  var historySqliteRepository = HistorySqliteRepository();
  var name = TextEditingController();

  late SharedPreferences prefs;

  void getData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name.text = prefs.getString('name') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 236, 247),
      appBar: AppBar(title: Text("Calcule seu IMC")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Digite abaixo os seus dados e aperte em 'Calcular' para ver o resultado.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Seu nome",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(controller: name),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Seu peso em quilos (ex: 82)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(controller: peso),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Sua altura em metros (ex: 1,78)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(controller: altura),
          ),
          SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () async {
                resultado = "";
                if (peso.text.isEmpty || altura.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Os campos não podem estar vazios."),
                    ),
                  );
                } else if (double.tryParse(peso.text) == null ||
                    double.tryParse(altura.text.replaceAll(",", ".")) == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Confirme se preencheu os dados corretamente.",
                      ),
                    ),
                  );
                } else {
                  resultado = (calcularIMC.resultadoIMC(
                    double.parse(peso.text),
                    double.parse(altura.text.replaceAll(",", ".")),
                  ));

                  await historySqliteRepository.save(
                    HistorySqliteModel(calculatedIMC: resultado, date: DateTime.now()),
                  );

                  await prefs.setString('name', name.text);
                }
                setState(() {});
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              child: Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.fromLTRB(40, 16, 0, 8),
            child: Text(
              "Resultado",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  resultado,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
              child: Text("Ver histórico de medições"),
            ),
          ),
        ],
      ),
    );
  }
}
