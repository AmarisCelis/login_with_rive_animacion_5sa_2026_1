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

  //crear el cerebro de la animacion
  StateMachineController? _controller;

  //SMI: State Machine Input
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;

  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
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
                child: RiveAnimation.asset(
                  'assets/animated_login_bear.riv',
                  stateMachines: ['Login Machine'],
                  //Al iniciar la animacion
                  onInit: (artboard){
                    _controller= StateMachineController.fromArtboard(
                      artboard,
                      'Login Machine',
                      );
                      //verifica que inicio bien
                      if (_controller == null) return;
                      //agrega el controlador al tabblero/escenario
                      artboard.addController(_controller!);

                      //vincular variables
                      _isChecking = _controller!.findSMI('isChecking');
                      _isHandsUp = _controller!.findSMI('isHandsUp');
                      _trigSuccess = _controller!.findSMI('trigSuccess');
                      _trigFail = _controller!.findSMI('trigFail');
                  },
                  ),
                ),
                //para separacion
                const SizedBox(height:10),

                //campo de texto email
                TextField(
                  onChanged:(value){
                    if(_isHandsUp != null){
                      //No tapes los ojos al ver email
                      _isHandsUp!.change(false);
                    }
                    //Si isChecking es nulo
                    if (_isChecking == null) return;
                    //Activar el modo chismoso
                    _isChecking!.change(true);
                  },


                  //para mostrar un Tipo de teclado
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
              //caampo de texto contraseña
              TextField(
                  onChanged:(value){
                    
                    //Si isChecking no es nulo
                    if (_isChecking != null) {
                    //No quiero el modo chismoso
                    _isChecking!.change(false);
                    }
                    //Si HandsUp es nulo
                    if(_isHandsUp == null) return;
                      //levanta las manos
                      _isHandsUp!.change(true);
                    
                  },
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