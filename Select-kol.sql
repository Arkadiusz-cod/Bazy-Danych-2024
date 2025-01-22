1) select nazwisko from pracownik order by nazwisko asc;

2)select imie, nazwisko, pensja from pracownik where data_urodzenia > '1979-12-31';

3)select * from pracownik where pensja between '3500' and '5000';

4)select towar from stan_magazynowy where ilosc > '10';

5)select nazwa_towaru from towar where nazwa_towaru like 'a%' or nazwa_towaru like 'b%' or nazwa_towaru like 'c%';

6)select * from klient where nip is null;

7)select * from zamowienie order by data_zamowienia desc limit 10;

8)select * from pracownik order by pensja asc limit 5;

9)select * from towar where nazwa_towaru NOT LIKE '%a%' order by cena_zakupu desc limit 10;

10)select stan_magazynowy.towar, towar.id_towaru, towar.nazwa_towaru from stan_magazynowy, towar where towar.id_towaru = stan_magazynowy.towar and stan_magazynowy.jm = 3 order by towar.nazwa_towaru;

select stan_magazynowy.towar, towar.id_towaru, towar.nazwa_towaru, towar.cena_zakupu from stan_magazynowy, towar where towar.id_towaru = stan_magazynowy.towar and stan_magazynowy.jm = 3 order by towar.cena_zakupu asc;

11)create table towary_powyzej_100 as select towar.nazwa_towaru, towar.cena_zakupu from towar where towar.cena_zakupu > 100;

12)create table pracownik_50_plus as select * from pracownik where timestampdiff(year, pracownik.data_urodzenia, curdate()) >= 50;

13)create table pracownik_50_plus as select * from pracownik where pracownik.data_urodzenia like '1975%'

========================================================CZESC 2=======================================================

1)select pracownik.imie, pracownik.nazwisko, dzial.nazwa from pracownik, dzial where dzial.id_dzialu = pracownik.dzial;

2)SELECT towar.nazwa_towaru, kategoria.nazwa_kategori, stan_magazynowy.ilosc FROM towar, kategoria, stan_magazynowy WHERE towar.id_towaru = stan_magazynowy.towar AND kategoria.id_kategori = towar.kategoria ORDER BY stan_magazynowy.ilosc ASC;

3)select * from zamowienie where status_zamowienia = '6';

4)select * from adres_klienta where miejscowosc like 'olsztyn';

5)select distinct (jednostka_miary.nazwa) from jednostka_miary, stan_magazynowy where jednostka_miary.id_jednostki not in (select jm from stan_magazynowy);

6)

7) select * from zamowienie where status_zamowienia != '5';
