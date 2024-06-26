import 'package:flutter/material.dart'; // Importação da biblioteca Flutter Material
import 'package:shared_preferences/shared_preferences.dart'; // Importação da biblioteca de preferências compartilhadas

void main() {
  runApp(MyApp()); // Execução do aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Define o tema claro como padrão
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
      ),
      home: HomePage(), // Define a tela inicial do aplicativo como HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(); // Cria o estado da tela HomePage
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ?? false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('darkMode', _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title: Text('Armazenamento Interno'), // Título da barra de aplicativos
        ),
        body: Center(
          child: Switch(
            value: _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
            onChanged: (value) {
              _toggleDarkMode(); // Chama a função para alternar o tema escuro
            },
          ),
        ),
      ),
    );
  }
}
