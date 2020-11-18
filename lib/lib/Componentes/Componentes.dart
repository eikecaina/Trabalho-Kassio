
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes{

  static rotulo(String rotulo){
    return Text(
      rotulo,
      style: TextStyle(
          color: Colors.white,
          wordSpacing: 5,
          letterSpacing: 2,
          fontFamily: 'Arial Bold',
          fontWeight: FontWeight.w900,
          fontSize: 18),

    );
  }


  static caixaDeTexto(String rotulo, String dica, TextEditingController controlador, validacao, {bool obscure=false, bool numero=false}){
    return TextFormField(
      controller: controlador,
      obscureText: obscure,
      validator: validacao,
      keyboardType: numero?TextInputType.number:TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle:TextStyle(fontSize: 18, color: Colors.white),
        hintText: dica,
        hintStyle:TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  static botao(String _texto,int _num, Function _f){
    return Container(
      child: RaisedButton(
        onPressed: _f,
        child: Text(
          _texto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 4)
        ),
        color: Colors.black87.withOpacity(0.4),
        hoverColor: Colors.yellow.withOpacity(0.3),
      ),
    );

  }
}