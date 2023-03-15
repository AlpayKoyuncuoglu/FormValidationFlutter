import 'package:flutter/material.dart';
import 'package:flutter_application_3/text_form_field_kullanimi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: TextFormFieldKullanimi(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'emre@emre.com');
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  void dispose() {
    print("dispose çalıştı");
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                focusNode: _focusNode,
                controller: _emailController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                autofocus: true,
                maxLength: 144,
                maxLines: maxLineCount,
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);

                    setState(() {
                      //_emailController.text=deger;
                      _emailController.value = TextEditingValue(
                          text: deger,
                          selection:
                              TextSelection.collapsed(offset: deger.length));
                    });
                  }
                },
                onSubmitted: (String deger) {
                  print("submit" + deger);
                },
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                    labelText: 'label text',
                    hintText: 'email giriniz',
                    // icon: Icon(Icons.add),
                    prefixIcon: Icon(Icons.add),
                    fillColor: Colors.amber,
                    filled: true,
                    suffixIcon: Icon(Icons.whatshot_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              )),
          Text(_emailController.text),
          Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
              )),
          FloatingActionButton(onPressed: () {
            _emailController.text = 'kync';
            setState(() {});
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _emailController.text = 'alpayzpc';
        setState(() {});
      }),
    );
  }
}
