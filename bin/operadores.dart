import 'dart:async';

import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

void main() {
  // map
  // final lista =  [1, 2, 3, 4];
  // final listaMapeada = lista.map((e) => e *2 ).where((e) => e > 2);
  // print(listaMapeada);
  // final streamController = StreamController.broadcast();

  // streamController.stream.listen((event) {
  //   print("Strem comum $event");
  // });

  // streamController.stream.map((event) => event * 2).listen((event) {
  //   print("Stram transformada $event");
  // });

  // streamController.add(10);
  // streamController.add(12);

  // Where

  //   final lista =  [1, 2, 3, 4];
  //   final listaFiltrada = lista.where((element) => element > 2);
  //   final streamController = StreamController.broadcast();
  //   print(listaFiltrada);

  // streamController.stream.listen((event) {
  //   print("Strem comum $event");
  // });

  // streamController.stream.where((event) => event > 2).listen((event) {
  //   print("Stram transformada $event");
  // });

  // streamController.add(1);
  // streamController.add(2);
  // streamController.add(3);
  // streamController.add(4);

  // take e skip
  // final streamController = StreamController.broadcast();

  // streamController.stream.take(2).listen((event) {
  //   print("take $event");
  // });

  //   streamController.stream.skip(2).listen((event) {
  //   print("skip $event");
  // });

  // streamController.add(1);
  // streamController.add(2);
  // streamController.add(3);
  // streamController.add(4);

// expand
//   final streamController = StreamController.broadcast();

// // o expand consegui unir todos os dados de uma strem ou array
//     streamController.stream.expand((element) => element).listen((event) {
//     print("expand $event");
//   });

//   streamController.add([1,2,3,4]);
//   streamController.add([5,6,7,8]);

// distinc

//   final streamController = StreamController<Homem>.broadcast();

// // o distinc serve para distinguir valores
//     streamController.stream.distinct((before,current) =>
//       before.nome.endsWith('o') && current.nome.endsWith('o')
//     ).listen((event) {
//     print("expand ${event.nome}");
//   });

//   streamController.add(Homem('joão'));
//   streamController.add(Homem('joão'));

//   streamController.add(Homem('Carlos'));
//   streamController.add(Homem('Carlos'));

//   streamController.add(Homem('Mario'));
//   streamController.add(Homem('Mario'));

// async map e handle error
  // final streamController = StreamController.broadcast();

  // streamController.stream.listen((event) {
  //   print("Strem comum $event");
  // });

  // streamController.stream.asyncMap((event) => fakeRequest(event))
  // .handleError(handle, test:myTest).listen((event) {
  //   print("Stram transformada $event");
  // });

  // streamController.add('o');
  // // streamController.add(12);

  // Timer

  // Observable.timer(10, Duration(seconds: 1)).listen((event) {
  //   print(event);
  // });

  // range

  // Observable.range(1, 10).listen((event) {
  //   print(event);
  // });

  // SwitchMap
  // Observable
  // .range(1, 4)
  // .switchMap((value) =>
  //   Observable.timer(value, Duration(seconds: 1))
  // ).listen((event) {
  //   print(event);
  // });

  // pipe/ compartilhando dados entre stream
  // o pipe canaliza um evento do b para o c
  // Você não pode adicionar dados no cara compartilhado(c) quando usa o pipe
  // BehaviorSubject<String> b = new BehaviorSubject<String>();
  // BehaviorSubject<String> c = new BehaviorSubject<String>();

  // b.stream.pipe(c);
  // b.sink.add('Ola');
  // b.stream.listen(print);
  // c.stream.listen(print);

  // Compartilhando dados
  // BehaviorSubject<String> b = new BehaviorSubject<String>();
  // BehaviorSubject<String> c = new BehaviorSubject<String>();
  // b.stream.listen(c.sink.add);

  // b.sink.add('event');
  // b.stream.listen(print);
  // c.stream.listen(print);

  // Start With/Start With Many
  // BehaviorSubject<String> b = new BehaviorSubject<String>();
  // // b.stream.startWithMany(["RULLY","pÃO"]).listen(print);
  // b.stream.startWith("RULLY").listen(print);
  // b.sink.add('J');
  // b.sink.add('A');

  // MergeWith/Merge
  BehaviorSubject<String> b = new BehaviorSubject<String>();
  BehaviorSubject<String> c = new BehaviorSubject<String>();

  // Observable observable = b.mergeWith([c.stream]);
  Observable observable = Observable.merge([b.stream, c.stream]);

  observable.listen((event) {
    print(event);
  });

  b.sink.add("B");
  b.sink.add("C");
}

class Homem {
  String nome;
  Homem(this.nome);
}

void handle(error, stack) {
  print("Erro: $error");
}

bool myTest(error) {
  if (error is String) {
    return true;
  } else {
    return false;
  }
}

Future<List<String>> fakeRequest(String query) async {
  await Future.delayed(Duration(microseconds: 500));
  throw "aaaaaaaaa";
  return ['João', 'Carlos', 'Daniel', 'Romario']
      .where((element) => element.contains(query))
      .toList();
}
