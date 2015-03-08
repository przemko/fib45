# fib45
##Porównanie szybkości programów w wybranych językach programowania

###Eksperyment
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

###Analiza
Warto zauważyć, że przy dostatecznie wysokim poziomie optymalizacji kodu, kompilatory języków **C** i **Swift** zamieniły jedno z dwóch wywołań rekurencyjnych w funkcji _Fib_(_n_) na iterację. 

Przekład w języku assemblera tak zamienionej rekurencji znajduje się w pliku fib.swift.s.

Zamieniając z powrotem na język **C**, odczytać możemy go mniej więcej tak:
>int fib(int n){int a=1; while(n>1) a+=fib((n--)-2); return a;}

Poprawność powyższej postaci wynika z tego, że po wyjściu z pętli **while** wartość zmiennej _a_ spełnia następujący warunek:
>a = 1 + fib(n-2) + fib(n-3) + ... + fib(0) = fib(n)

Tak naprawdę, to w przekładzie rekurencyjnie wywoływana jest wartość _fib_(_n_-1) i w pętli zmienna _n_ maleje o 2, ale powyższa postać jest temu równoważna.

Na szczególną uwagę zasługuje czas wykonania programu w języku [Swift](http://developer.apple.com/swift/ "język programowania Swift"). Po zastosowaniu opcji **Ounchecked** kompilator rozwinął postać rekurencyjną i zadecydował, że zamiast wyliczać wyraz _fib_(45) z postaci rekurencyjnej, to wyliczy korzystając z rekurencji wyrazy _fib_(40), _fib_(39), _fib_(38), _fib_(37), _fib_(36), _fib_(35) a z nich dodając i mnożąc przez dwa wyliczy wartość _fib_(45):
>RBX = fib(40), R14 = fib(39), LOC1 = fib(39), R15 = fib(38), R12 = fib(37), R13 = R12 + R15 = fib(39), R15 = R15 + R14 = fib(40), R14 = fib(36), R12 = R12 + R14 = fib(38), RAX = R12 + R13 = fib(40), LOC2 = RAX = fib(40), R13 = R13 + R15 = fib(41), RCX = RAX + R13 = fib(42), LOC3 = RCX = fib(42), RAX = fib(35), RBX = RBX + LOC1 = fib(41), RBX = RBX + R15 = fib(42), RBX = RBX + R14 = fib(42) + fib(36), RBX = RBX + R13 = fib(43) + fib(36), RBX = RBX + RAX = fib(43) + fib(37), RBX = RBX + R12 = fib(43) + fib(39), RBX = RBX + LOC2 = fib(43) + fib(41), RAX = LOC3 = fib(42), RAX = 2 * RAX + RBX = 2 * fib(42) + fib(43) + fib(41) = (fib(43) + fib(42)) + (fib(42) + fib(41)) = fib(44) + fib(43) = fib(45)

W powyższym ciągu wyliczeń RAX, RBX, RCX, R12, R13, R14 i R15 są nazwami rejestrów z przekładu  fib.swift.s,  natomiast LOC1, LOC2 i LOC3, to miejsca odkładania wartości rejestrów.

Oczywiście człowiek policzyłby wynik zdecydowanie prościej np. ze wzoru _fib_(45) = 8 * _fib_(40) + 5 * _fib_(39), ale i tak jestem pełen podziwu dla kompilatora języka **Swift** za jego pomysłowość i zejście z czasem działania poniżej jednej sekundy.

###Dalsze obserwacje
Przyglądając się jak poradził sobie kompilator **Swift** z optymalizacją kodu pomyślałem aby do obliczenia wartości _Fib_(_n_) użyć dwóch wcześniejszych wartości _Fib_(_n_ - _k_) i _Fib_(_n_ - _k_ - 1). 

Wiedząc, że liczba operacji dodawania podczas obliczania wartości _Fib_(_n_) wynosi _Fib_(_n_) - 1, można pokusić się o taki dobór wartości _k_ dla danego _n_, by minimalizować liczbę dodawań.

Można sprawdzić indukcyjnie, że między _Fib_(_n_), _Fib_(_n_ - _k_) i _Fib_(_n_ - _k_ - 1) zachodzi następująca zależność:
>Fib(n) = Fib(k) * Fib(n-k) + Fib(k-1) * Fib(n-k-1)

Uzasadnienie drugiego kroku dowodu indukcyjnego po _k_:
>Fib(k+1) * Fib(n-(k+1)) + Fib((k+1)-1) * Fib(n-(k+1)-1) = (Fib(k) + Fib(k-1)) * Fib(n-k-1) + Fib(k) * Fib(n-k-2) = Fib(k) * Fib(n-k-1) + Fib(k) * Fib(n-k-2) + Fib(k-1) * Fib(n-k-1) = Fib(k) * Fib(n-k) + Fib(k-1) * Fib(n-k-1)

Nie będzie chyba niespodzianką, że najmniejszą liczbę dodawań otrzymuje się dla _k_ równego _n_ **div** 2.

Funkcję rekurencyjną można zapisać następująco:
>int fib(int n){int k=n/2; if(n<2) return 1; return fib(k) * fib(n-k) + fib(k-1) * fib(n-k-1);}

Ma ona czasową złożoność obliczeniową rzędu O(_n_ ^ 2) ponieważ są cztery wywołania dla o połowę mniejszego parametru.

Zauważając, że wartości _k_ i _n_ - _k_ oraz _k_ - 1 i _n_ - _k_ - 1 są dla _k_ = _n_ **div** 2 albo równe albo prawie równe, można zmniejszyć liczbę wywołań rekurencyjnych w powyższym przykładzie z czterech do dwóch. Uzyska się wtedy czasową złożoność obliczeniową rzędu O(_n_).

W plikach **fib2.c** i **fib2.pl** znajdują się odpowiednie kody. 

W pliku **fib2.txt.gz** znajdują się wartości _Fib_(10), _Fib_(100), _Fib_(1000), _Fib_(10000), _Fib_(100000) i _Fib_(1000000) policzone programem **fib2.pl** napisanym w **Prologu**. Przy każdym wyniku można znaleźć liczbę wykonanych kroków wnioskowania i czas obliczenia.

###Środowisko
Obliczenia przeprowadzano pod systemem **OS X Yosemite** na notebooku **MacBook Pro** wyposażonym w procesor **2,6 GHz Intel Core i5**. 

Wykorzystano następujące narzędzia programistyczne.

####Ada
Kompilator **GNAT 4.9.1** z opcją **-O3**.

####C
Kompilator **GCC 4.9.1** z opcją **-O3**.

####Erlang
Wersja **R16B03**. 

####Go
Wersja **1.4.2**. 

####Haskell
Kompilator **GHC 7.8.3** z opcją **-O**.

####Java
Wersja **1.8.0**.

####JavaScript
Platforma **node.js 0.12.0**.

####Julia
Wersja **0.3.6**.

####Oz
Wersja **1.4.0**.

####PHP
Wersja **5.5.14**.

####Prolog
Kompilator **swi-prolog 6.6.6**.

####Python
Wersja **3.2.5**, kompilator **pypy3 2.4.0**.

####Scheme
Wersja **9.2**.

####Swift
Kompilator **swiftc 1.2** z opcją **-Ounchecked**. Póki co, ta wersja języka dostępna jest w deweloperskim środowisku **Xcode 6.3 beta**.
