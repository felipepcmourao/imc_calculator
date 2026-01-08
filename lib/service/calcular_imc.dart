class CalcularImc {
  double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  String resultadoIMC(double peso, double altura) {
    var imc = calcularIMC(peso, altura).toStringAsFixed(2).replaceAll(".", ",");
    switch (calcularIMC(peso, altura)) {
      case < 16:
        return "$imc - Magreza Grave";
      case >= 16 && < 17:
        return "$imc - Magreza Moderada";
      case >= 17 && < 18.5:
        return "$imc - Magreza Leve";
      case >= 18.5 && < 25:
        return "$imc - Saudável";
      case >= 25 && < 30:
        return "$imc - Sobrepeso";
      case >= 30 && < 35:
        return "$imc - Obesidade Grau I";
      case >= 35 && < 40:
        return "$imc - Obesidade Grau II (severa)";
      case >= 40:
        return "$imc - Obesidade Grau III (mórbida)";
      default:
        return "Deu ruim";
    }
  }
}
