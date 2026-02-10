import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // control para mostrar/ocultar la contraseña
  bool _obscureText = true; //no va a cambiar
  @override
  
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;   //para que sirve el mediaquery, cualquier informacon del dispositivo, va a buscar info del dispositivo, obtenemos el valor para obtener el tamaño
    return Scaffold(
      //Evita que se quite espacio del nudge
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0), //wrap  envolver
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset('assets/animated_login_bear.riv')),
                //para separacion
                const SizedBox(height:10),
                TextField(
                  //Tipo de teclado
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText:'Email', //pista
                    prefixIcon: const Icon (Icons.email), 
                    border:OutlineInputBorder(
                      //para redondear los bordes
                      borderRadius:BorderRadius.circular(12),
                      //OutlineInputBorder
                    
                  ),
                ),
          
          
              ),
              const SizedBox(height:10),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    //if ternario
                    icon:Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      
                    ),
                    onPressed: (){
                        //refresca el icono
                        setState((){
                          _obscureText = !_obscureText;
                        });
                      }
                  ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ), 
              SizedBox(height:10),
          
            ],
          ),
        )
        )
    );
  }
}