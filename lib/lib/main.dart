import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/API.dart';
import 'package:weather_app/Componentes/Componentes.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController callerRequisition = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String temperatura = "Temperatura: " ;
  String data = "Data: ";
  String hora = "Hora: ";
  String cidadeUF = "Cidade/Estado: ";
  String umidade = "Umidade: ";
  String weekday = "weekday";


  clickedButton() async{
    if(!cForm.currentState.validate()){
      return null;
    }else{
      String url = "https://api.hgbrasil.com/weather?format=json&key=a1ead3af&city_name=${callerRequisition.text}";
      http.Response response = await http.get(url);
      Map returnResult = json.decode(response.body);
      setState(() {
        temperatura = "Temperatura: " + returnResult["results"]["temp"].toString() + "°C";
        hora        = "Hora: " + returnResult["results"]["time"] + " -- Horário de Brásilia ";
        cidadeUF    = "Cidade/Estado: " + returnResult["results"]["city"];
        umidade     = "Umidade: " + returnResult["results"]["humidity"].toString() +  " % ";
        data        = "Data: " + returnResult["results"]["date"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(5, 44, 92, 1.0),
      body: SingleChildScrollView(
          child: Form(

            key: cForm,
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset("assets/image/previsaodotempo.jpg",
                        fit: BoxFit.contain,
                      ),

                  ),
                  Componentes.caixaDeTexto("Digite sua cidade", "Nome da sua cidade", callerRequisition, null),
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(top: 35),
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: clickedButton,
                        icon: FaIcon(FontAwesomeIcons.cloudSun, color: Colors.white, size: 64),
                        padding: EdgeInsets.only(bottom: 45,right: 45),
                    ),
                  ),
                  Container(
                      height: 50,
                  ),
                  Componentes.rotulo(temperatura),
                  Componentes.rotulo(data),
                  Componentes.rotulo(hora),
                  Componentes.rotulo(cidadeUF),
                  Componentes.rotulo(umidade),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

