# Biecz 1.6 — zasob IIIF do Allmaps (KOLORY POPRAWIONE)

Wersja z prawidlowymi barwami. Poprzednia miala odwrocone kolory (obraz w PDF
byl w CMYK i konwersja go znegowala) — ta jest wyrenderowana przez silnik PDF,
wiec kolory sa naturalne.

Pole "id" w info.json jest juz ustawione na:
  https://wweronikad.github.io/serwis-ahmp/biecz_1_6
Jesli NIE zmieniasz nazwy uzytkownika/repozytorium, NIC nie musisz robic ze
skryptem set-id.sh.

## Co zrobic
1. W repozytorium "serwis-ahmp" USUN stary folder biecz_1_6 (mial zle kolory).
2. Wgraj nowy folder biecz_1_6/ z tej paczki (Add file -> Upload files lub git push).
3. Pages juz dziala, wiec po chwili sprawdz w przegladarce:
   https://wweronikad.github.io/serwis-ahmp/biecz_1_6/info.json
4. W Allmaps Editor zaladuj ten sam URL info.json. Poniewaz obraz ma teraz inne
   wymiary (4104 x 2982), zrob maske i punkty kontrolne od nowa
   (poprzednie i tak byly na blednym obrazie).

## Gdybys zmieniala nazwe repo
   ./set-id.sh https://TWOJA-NAZWA.github.io/NOWE-REPO

Zrodlo: raster z PDF wyrenderowany w 150 dpi (= natywna rozdzielczosc obrazu).
