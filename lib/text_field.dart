import 'package:flutter/material.dart';

class TextInput extends StatefulWidget 
{
  const TextInput({ Key? key }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> 
{

  TextEditingController _controllerAlcohol = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();
  String _textResult = "";

  void _calculate()
  {
    double? priceAlcohol = double.tryParse( _controllerAlcohol.text);
    double? priceGasoline = double.tryParse( _controllerGasoline.text);

    if( priceAlcohol == null || priceGasoline == null )
    {
      setState(() {
        _textResult = "Type valid numbers with .";
      });
    }
    else
    {
      if ((priceAlcohol / priceGasoline) >= 0.7) 
      {
        setState(() 
        {
          _textResult = "Refuel with GASOLINE";
        });
      }
      else
      {
        setState(() 
        {
          _textResult = "Refuel with ALCOHOL";
        });
      }  
    }
    _clearText();
  }

  void _clearText()
  {
    _controllerAlcohol.text = "";
    _controllerGasoline.text = "";
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Alcohol or Gasoline"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            // Image 
            Image.asset("images/logo.png"),
            // Text
            const Text(
              "Find out which is the best option for fueling your car", 
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TextField
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Alcohol Price i.e: 3.50",
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              controller: _controllerAlcohol,
            ),
            // TextField
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Gasoline Price i.e: 5.10",
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              controller: _controllerGasoline,
            ),
            // Button
            ElevatedButton(
              onPressed: _calculate, 
              child: const Text("Calculate", 
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            // Text Result
            Text(
              _textResult, 
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}