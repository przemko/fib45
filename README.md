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

Warto zauważyć, że przy dostatecznie wysokim poziomie optymalizacji kodu, kompilatory języków C i Swift zamieniły jedno z dwóch wywołań rekurencyjnych w funkcji _Fib_(_n_) na iterację. 

Przekład w języku assemblera tak zamienionej rekurencji znajduje się w pliku fib.swift.s.

Zamieniając z powrotem na język C, odczytać możemy go mniej więcej tak:
>int fib(int n){int a=1; while(n>1) a+=fib((n--)-2); return a;}

Poprawność powyższej postaci wynika z tego, że po wyjściu z pętli **while** wartość zmiennej _a_ spełnia następujący warunek:
>a = 1 + fib(n-2) + fib(n-3) + ... + fib(0) = fib(n)

Tak naprawdę, to w przekładzie rekurencyjnie wywoływana jest wartość _fib_(_n_-1) i w pętli zmienna _n_ maleje o 2, ale powyższa postać jest temu równoważna.

Na szczególną uwagę zasługuje czas wykonania programu w języku [Swift](http://developer.apple.com/swift/ "język programowania Swift"). Po zastosowaniu opcji **-Ounchecked** kompilator rozwinął postać rekurencyjną i zadecydował, że zamiast wyliczać wyraz _fib_(45) z postaci rekurencyjnej, to wyliczy korzystając z rekurencji wyrazy _fib_(40), _fib_(39), _fib_(38), _fib_(37), _fib_(36), _fib_(35) a z nich dodając i mnożąc przez dwa wyliczy wartość _fib_(45):
>RBX = fib(40), R14 = fib(39), LOC1 = fib(39), R15 = fib(38), R12 = fib(37), R13 = R12 + R15 = fib(39), R15 = R15 + R14 = fib(40), R14 = fib(36), R12 = R12 + R14 = fib(38), RAX = R12 + R13 = fib(40), LOC2 = RAX = fib(40), R13 = R13 + R15 = fib(41), RCX = RAX + R13 = fib(42), LOC3 = RCX = fib(42), RAX = fib(35), RBX = RBX + LOC1 = fib(41), RBX = RBX + R15 = fib(42), RBX = RBX + R14 = fib(42) + fib(36), RBX = RBX + R13 = fib(43) + fib(36), RBX = RBX + RAX = fib(43) + fib(37), RBX = RBX + R12 = fib(43) + fib(39), RBX = RBX + LOC2 = fib(43) + fib(41), RAX = LOC3 = fib(42), RAX = 2 * RAX + RBX = 2 * fib(42) + fib(43) + fib(41) = (fib(43) + fib(42)) + (fib(42) + fib(41)) = fib(44) + fib(43) = fib(45)

W powyższym ciągu wyliczeń RAX, RBX, RCX, R12, R13, R14 i R15 są nazwami rejestrów z przekładu  fib.swift.s,  natomiast LOC1, LOC2 i LOC3, to miejsca odkładania wartości rejestrów.

Oczywiście człowiek policzyłby wynik zdecydowanie prościej np. ze wzoru _fib_(45) = 8 * _fib_(40) + 5 * _fib_(39), ale i tak jestem pełen podziwu dla kompilatora języka Swift za jego pomysłowość i zejście z czasem działania poniżej jednej sekundy.
