import 'package:rxdart/rxdart.dart';
import 'dart:async';

void main() {
  // controladores de fluxo são elementos que podem ser fluxos e também eventos
  // pode adicionar dados a um fluxo
  // também pode ser o próprio fluxo
  // PublishSubject p = new PublishSubject();

  // // acessando a saida
  // p.stream.listen(print);
  //     // sink é o evento
  // p.sink.add(1);
  // p.sink.add(2);
  // p.sink.add(3);

  // BehaviorSubject é um controlador de fluxo.
  // BehaviorSubject b = new BehaviorSubject();
  // b.sink.add(15);
  // b.sink.add(16);
  // b.stream.listen(print);
  // print(b.value);

  // ReplaySubject r = new ReplaySubject();
  // r.sink.add(11);
  // r.sink.add(90);
  // r.sink.add(56);
  // r.stream.listen((data)=>{
  //   print(data)
  // });
  // print(r.values);

  // tipagem de strem
  // BehaviorSubject b = new BehaviorSubject<int>();
  // b.stream.listen((event) {
  //   print(event);
  // });
  // b.sink.add(15);

  // debounce
  // BehaviorSubject<String> b = new BehaviorSubject<String>();
  // b.stream.debounce(Duration(milliseconds: 1)).listen((event) {
  //   print(event);
  // });
  // b.sink.add('10');
  // b.sink.add('50');
  // b.sink.add('20');


}