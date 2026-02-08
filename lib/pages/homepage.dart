import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/imc_calculation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.amber,
=======
      backgroundColor: const Color.fromARGB(255, 214, 20, 10),
>>>>>>> ice
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Card(
                    child: Text(
                      "Calculadora IMC",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 16, 0, 8),
                child: Text(
                  "Para que serve?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "O IMC (Índice de Massa Corporal) é um cálculo utilizado para avaliar se o peso de uma pessoa está adequado em relação à sua altura. Ele serve como uma ferramenta simples de triagem, ajudando a identificar se alguém está abaixo do peso, com peso considerado saudável, com sobrepeso ou obesidade. \n\nEmbora não leve em conta fatores como massa muscular, idade ou composição corporal, o IMC é amplamente usado por profissionais de saúde para monitorar riscos à saúde e orientar cuidados relacionados ao bem-estar e à qualidade de vida.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 0.9, // 90% da tela
                        child: ImcCalculation(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Calcular IMC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
