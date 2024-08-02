import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:statefull_pratice/components/dropdownMenuCustom.dart';
import 'package:statefull_pratice/components/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _capturedValue = 0;
  int _capturedValue2 = 0;
  var _result = 0;
  String _selectedOperation = 'Selecciona una operación';
  String _operation = '';

  final NumberFormat _numberFormat = NumberFormat('#,##0');

  void _calculate() {
    setState(() {
      if (_operation == '+') {
        _result = _capturedValue + _capturedValue2;
      } else if (_operation == '-') {
        _result = _capturedValue - _capturedValue2;
      } else if (_operation == '*') {
        _result = _capturedValue * _capturedValue2;
      } else if (_operation == '/') {
        if (_capturedValue2 == 0) {
          _result = 0; // Manejo de división por cero
        } else {
          _result = _capturedValue ~/ _capturedValue2; // División flotante
        }
      }
    });
  }

  void _handleOperationChanged(String operation) {
    setState(() {
      _selectedOperation = operation;
      if (_selectedOperation == 'Suma') {
        _operation = '+';
      } else if (_selectedOperation == 'Resta') {
        _operation = '-';
      } else if (_selectedOperation == 'Multiplicación') {
        _operation = '*';
      } else if (_selectedOperation == 'División') {
        _operation = '/';
      }
    });
  }

  void _handleValueChanged(value) {
    setState(() {
      _capturedValue = value;
    });
  }

  void _handleValueChanged2(value) {
    setState(() {
      _capturedValue2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calculator App',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_numberFormat.format(_capturedValue)} $_operation ${_numberFormat.format(_capturedValue2)} = ${_numberFormat.format(_result)}',
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              TextFieldCustom(
                title: 'Introduce un valor',
                onChanged: _handleValueChanged,
                onChanged2: _calculate,
              ),
              TextFieldCustom(
                  title: 'Introduce un valor',
                  onChanged: _handleValueChanged2,
                  onChanged2: _calculate),
              DropdownCustom(
                onChanged: _handleOperationChanged,
                onChanged2: _calculate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
