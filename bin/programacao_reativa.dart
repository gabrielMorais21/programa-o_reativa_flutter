import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() {
// operadores: existem os observables e também os eventos
// o que são observavei, observaveis podem ser ouvidos ou
// pode ser visto e basicamente ele pode emitir algum tipo de dado
// não podemos adicionar dados a um observavel diretamente

  Observable observable = Observable.just("a");
  observable.listen(print,
      onDone: () => {
            //  print('terminei');
          });

// uma boa pratica sempre que você tiver um controlador de fluxo
// você deve fechar ele quando não precisar mais
  // BehaviorSubject b = new BehaviorSubject();
  // StreamSubscription subscription = b.stream.listen(print);
  // subscription.onData((data) {
  //   print("mudei $data");
  // });

  // b.sink.add(10);
  // b.sink.add(15);
  // // subscription.pause();
  // b.sink.add(12);
  // // fechando controlador
  // // b.close();
}
