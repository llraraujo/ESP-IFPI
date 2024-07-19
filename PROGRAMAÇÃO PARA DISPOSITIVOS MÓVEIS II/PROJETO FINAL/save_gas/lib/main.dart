import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:save_gas/ResultViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Gas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const GasCalculator(title: 'Save Gas'),
    );
  }
}

class GasCalculator extends StatefulWidget {
  const GasCalculator({super.key, required this.title});

  final String title;

  @override
  State<GasCalculator> createState() => _GasCalculatorState();
}

class _GasCalculatorState extends State<GasCalculator> {
  final TextEditingController _precoGasolinaController =
      TextEditingController();
  final TextEditingController _precoAlcoolController = TextEditingController();
  final TextEditingController _performanceGasolinaController =
      TextEditingController();
  final TextEditingController _saldoDisponivelController =
      TextEditingController();
  final TextEditingController _destinoController = TextEditingController();
  final TextEditingController _distanciaController = TextEditingController();

  double _precoGasolina = 0.0;
  double _precoAlcool = 0.0;
  double _performanceGasolina = 0.0;
  double _performanceAlcool = 0.0;
  double _saldoDisponivel = 0.0;
  double _distancia = 0.0;
  String _destino = "";

  String? mensagemErroPrecoGasolina;
  String? mensagemErroPrecoAlcool;
  String? mensagemErroPrecoPerfomance;
  String? mensagemErroSaldo;
  String? mensagemErroDestino;
  String? mensagemErroDistancia;

  bool _validaCampos() {
    
    bool isValid = _validaCampoNumero(_precoGasolinaController, 1);
    isValid = _validaCampoNumero(_precoAlcoolController, 2) && isValid;
    isValid = _validaCampoNumero(_performanceGasolinaController, 3) && isValid;
    isValid = _validaCampoNumero(_saldoDisponivelController, 4) && isValid;
    isValid = _validaCampoNumero(_distanciaController, 6) && isValid;
    isValid = _validaCampoTexto(_destinoController) && isValid;

    return isValid;
  }

  bool _validaCampoNumero(TextEditingController controller, int op) {

    String? mensagem;
    if (controller.text.isEmpty) {
      mensagem = "Campo obrigatório! Preencha o campo.";
      _handleStateMensagemErro(mensagem, op);  
      return  false;
    }

    else if (double.tryParse(controller.text.trim()) == null) {
      mensagem = 'Formato Inválido. Preencha apenas com números';
      _handleStateMensagemErro(mensagem, op);  
      return false;
    }

    if (double.parse(controller.text.trim()) <= 0) {

      mensagem = 'Número inválido. Preencha com um número positivo';
      _handleStateMensagemErro(mensagem, op);  
      return false;
    }
    _handleStateMensagemErro(mensagem, op);  
    return true;
  }

  void _handleStateMensagemErro(String? mensagem, int op){
    setState(() {
      switch (op){
          case 1: mensagemErroPrecoGasolina = mensagem; break;
          case 2: mensagemErroPrecoAlcool = mensagem; break;
          case 3: mensagemErroPrecoPerfomance = mensagem; break;
          case 4: mensagemErroSaldo = mensagem; break;
          case 5: mensagemErroDestino = mensagem; break;
          case 6: mensagemErroDistancia = mensagem; break;
          default: mensagem = null;
      }
    });
  }

  bool _validaCampoTexto(TextEditingController controller) {

    if (controller.text.isEmpty) {
      _handleStateMensagemErro('Campo obrigatório!', 5);
      return false;
    }
    setState(() {
      _handleStateMensagemErro(null, 5);
    });

    return true;
  }

  void limparFormulario() {
    setState(() {
      _precoGasolinaController.text = "";
      _precoAlcoolController.text = "";
      _performanceGasolinaController.text = "";
      _saldoDisponivelController.text = "";
      _distanciaController.text = "";
      _destinoController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          this.widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('SaveGas', style: TextStyle(fontSize: 22.0,decoration: TextDecoration.none, color: Colors.green),),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _precoGasolinaController,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroPrecoGasolina,
                  border: const OutlineInputBorder(),
                  hintText: 'ex: R\$ 5.85',
                  label: const Text('Preço da Gasolina em R\$/L')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _precoAlcoolController,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroPrecoAlcool,
                  border: OutlineInputBorder(),
                  hintText: 'ex: R\$ 4.89',
                  label: Text('Preço do Álcool em R\$/L')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _performanceGasolinaController,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroPrecoPerfomance,
                  border: OutlineInputBorder(),
                  hintText: 'ex: 8.35 Km/L',
                  label: Text('Performance Gasolina Km/L')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _saldoDisponivelController,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroSaldo,
                  border: OutlineInputBorder(),
                  hintText: 'ex: R\$ 500',
                  label: Text('Dinheiro Disponível (R\$)')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _destinoController,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroDestino,
                  border: OutlineInputBorder(),
                  hintText: 'ex: Fortaleza',
                  label: Text('Destino')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _distanciaController,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  errorText: mensagemErroDistancia,
                  border: OutlineInputBorder(),
                  hintText: 'ex: 368 km',
                  label: Text('Total de quilômetros')),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                bool isCamposValidos = _validaCampos();
                if (isCamposValidos){
                  _distancia = double.parse(_distanciaController.text);
                  _saldoDisponivel =
                      double.parse(_saldoDisponivelController.text);

                  _performanceGasolina =
                      double.parse(_performanceGasolinaController.text);
                  _performanceAlcool = _performanceGasolina * 0.7;

                  double totalLitrosGasolina =
                      (_distancia / _performanceGasolina);
                  double totalLitrosAlcool = (_distancia / _performanceAlcool);

                  _precoGasolina = double.parse(_precoGasolinaController.text);
                  _precoAlcool = double.parse(_precoAlcoolController.text);

                  double custoTotalGasolina =
                      _precoGasolina * totalLitrosGasolina;
                  double custoTotalAlcool = _precoAlcool * totalLitrosAlcool;

                  _destino = _destinoController.text.toUpperCase();

                  var model = ResultViewModel(
                      totalLitrosGasolina: totalLitrosGasolina,
                      totalLitrosAlcool: totalLitrosAlcool,
                      custoTotalGasolina: custoTotalGasolina,
                      custoTotalAlcool: custoTotalAlcool,
                      destino: _destino,
                      distancia: _distancia,
                      saldo: _saldoDisponivel);

                  limparFormulario();

                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {                          
                      return GasCalculatorResult(model: model);
                    },
                  ));
                }
              },
              child: const Text('Calcular economia')),
        ]),
      )),
    );
  }
}

class GasCalculatorResult extends StatelessWidget {
  const GasCalculatorResult({super.key, required this.model});
  final ResultViewModel model;

  @override
  Widget build(BuildContext context) {
    final _screen =  MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'SaveGas - Resultados',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Resultado da Análise', style: TextStyle(fontSize: 22.0,decoration: TextDecoration.underline, color: Colors.green),),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
              SizedBox(width: _screen.width * 0.45, child: Text('Destino', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: Colors.black),)), 
              SizedBox(width: _screen.width * 0.45, child: Text(model.destino, textAlign: TextAlign.left))],),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
              SizedBox(width: _screen.width * 0.45, child: Text('Distância (Km)', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: Colors.black))), 
              SizedBox(width: _screen.width * 0.45, child: Text(model.distancia.toStringAsFixed(2), textAlign: TextAlign.left))],),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
              SizedBox(width: _screen.width * 0.45, child: Text('Saldo (R\$)', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: Colors.black))), 
              SizedBox(width: _screen.width * 0.45, child: Text(model.saldo.toStringAsFixed(2), textAlign: TextAlign.left))],),
            const SizedBox(height: 30),
            Text(
                'Litros de Gasolina necessários: ${model.totalLitrosGasolina.toStringAsFixed(2)}', style: TextStyle(fontSize: 16),),
            const SizedBox(height: 30),
            Text(
                'Custo total para a gasolina: R\$ ${model.custoTotalGasolina.toStringAsFixed(2)}',style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            Text(
                'Litros de Álcool necessários: ${model.totalLitrosAlcool.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            Text(
                'Custo total para o álcool: R\$ ${model.custoTotalAlcool.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            SizedBox(height: 200, child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(model.resultado(), style: TextStyle(fontSize: 18),),
  
            )),
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
