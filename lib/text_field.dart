import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({ Key? key }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Text Input"),
        centerTitle: true,
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Padding(
              padding: EdgeInsets.all(32),

              // Text Field
              child: TextField(
                // text, number, emailAddres, datetime
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Type a number",
                ),
                //enabled: false, //this is equivalet to 'input disabled attribute' in html
                //maxLength: 5,
                //maxLengthEnforced: false,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
                //obscureText: true, // usefull for password text field
                //onChanged: (String text){ print(text); }, // if you use this you have to remove const on children
                //onSubmitted: (String text){ print(text); }, // if you use this you have to remove const on children
                controller: _textEditingController, // if you use this you have to remove const on children

              ),
                            
            ),

            ElevatedButton(onPressed: (){ print(_textEditingController.text); }, child: Text("Save"))
            
          ],

        ),

      ),

    );

  }
}