import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

AudioPlayer audioPlayer = AudioPlayer();
AudioCache audioCache = AudioCache(prefix:"sons/");
var volumeInicial = 0.05;
var label;
bool primeiraTentativa = true;
_executarSons() async {

  audioPlayer.setVolume(volumeInicial);
  if(primeiraTentativa = true){
     audioPlayer = await audioCache.play("bach.mp3");
     primeiraTentativa = false;
  }
  else{
    audioPlayer.resume();
  }
 
  /*
 String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
 int result = await audioPlayer.play(url);
 */
}

_pausar() async {
  int result = await audioPlayer.pause();
  if(result == 1){
    //sucesso
   }
}

_parar() async {
   int result = await audioPlayer.stop();
   if(result == 1){
    //sucesso
   }
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Executando sons")),
      body: Column(
        children: [
          Slider(
            value: volumeInicial, 
            divisions: 10,
            max: 100,
            min: 0,
            onChanged: (volumeEscolhido){
              for(double cont = 0; cont <= volumeEscolhido; cont++ ){
                  label = cont;
              }
              setState(() {
                 volumeInicial = volumeEscolhido;
              },
              );
              audioPlayer.setVolume(volumeEscolhido);
            },
            label: label.toString(),
          
            ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(15), 
              child: GestureDetector(
                child: Image.asset("assets/imagem/executar.png"),
                onTap: (){
                  _executarSons();
                },
              ),),
              Padding(padding: EdgeInsets.all(15), 
              child: GestureDetector(
                child: Image.asset("assets/imagem/pausar.png"),
                onTap: (){
                  _pausar();
                },
              ),),
              Padding(padding: EdgeInsets.all(15), 
              child: GestureDetector(
                child: Image.asset("assets/imagem/parar.png"),
                onTap: (){
                   _parar();
                },
              ),)
            ],
          )
        ],
      )
    );
  }
}