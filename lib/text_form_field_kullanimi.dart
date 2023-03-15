import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Textformfield kullanıldı'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    //initialValue: 'EmreAltunBilek',
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.pink),
                        labelText: 'username',
                        hintText: 'username',
                        border: OutlineInputBorder()),
                    validator: (deger) {
                      if (deger.toString().length < 4)
                        return 'en az 4 karakter olmalıdır';
                      else {
                        return null;
                      }
                    },
                    onSaved: (deger) {
                      _userName = deger!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //initialValue: 'EmreAltunBilek@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.pink),
                        labelText: 'email',
                        hintText: 'email',
                        border: OutlineInputBorder()),
                    validator: (deger1) {
                      if (deger1!.isEmpty) {
                        return "bu alan boş bırakılamaz";
                      } else if (!EmailValidator.validate(deger1)) {
                        return "geçerli bir mail giriniz";
                      }
                    },
                    onSaved: (deger) {
                      _email = deger!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.pink),
                        labelText: 'password',
                        hintText: 'password',
                        border: OutlineInputBorder()),
                    validator: (deger) {
                      if (deger.toString().length < 6) {
                        return "6 dan fazla değer giriniz";
                      }
                    },
                    onSaved: (deger) {
                      _password = deger!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool _validate = _formKey.currentState!.validate();
                        if (_validate) {
                          _formKey.currentState!.save();

                          String result =
                              'username:  $_userName\nemail:  $_email\npassword:  $_password';
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 18),
                              ),
                              backgroundColor: Colors.green));
                          _formKey.currentState!.reset();
                        }
                      },
                      child: Text("onayla"))
                ],
              ),
            ),
          ),
        ));
  }
}
