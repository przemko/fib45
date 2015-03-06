# fib45
##Porównanie szybkości programów w wybranych językach programowania

Przeprowadzono testy szybkości działania programów w następujących językach programowania:

* Ada
* C
* Erlang
* Go
* Haskell
* Java
* JavaScript
* Julia
* Oz
* PHP
* Prolog
* Python
* Scheme
* Swift

W każdym z powyższych języków napisano kod obliczający wyrazy ciągu Fibonacciego:

> Fib(0) = 1; Fib(1) = 1; Fib(n) = Fib(n-1)+Fib(n-2), dla n > 1

Wybrano testowanie szybkości na przykładzie tej funkcji, gdyż wraz ze wzrostem wartości _n_, wykładniczo szybko rośnie liczba operacji arytmetycznych i wywołań rekurencyjnych potrzebnych do obliczenia wartości _Fib_(_n_).
 
Poniżej zamieszczono wykres czasu (w sekundach) obliczenia wartości _Fib_(45).

 ![wykres](fib45_opt.png "Czas obliczenia Fib(45) w sekundach") 

Jeśli była taka możliwość, to zalecano kompilatorowi optymalizację kodu wynikowego na jak najwyższym poziomie.

