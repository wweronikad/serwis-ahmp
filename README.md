# Biecz 1.6 — zasob IIIF do Allmaps

Ten folder zawiera mape **1.6. Miejscowy plan zagospodarowania przestrzennego
miasta Biecza (1975)** z Atlasu historycznego miast polskich, przygotowana jako
**statyczny zasob IIIF Image API 3.0** (level 0). Po wgraniu na GitHub Pages
Allmaps wczyta ja bez bledu CORS.

Zrodlo obrazu: raster wyekstrahowany bezstratnie z PDF (3267 x 2776 px).

## Zawartosc

```
biecz_1_6/          <- folder z kaflami + info.json (NIE zmieniaj nazwy)
  info.json         <- opis zasobu IIIF (tu jest pole "id")
  0,0,256,256/ ...  <- kafle (606 katalogow, 4 poziomy zoom)
set-id.sh           <- skrypt podmieniajacy "id" pod Twoj adres
README.md           <- ten plik
```

## Krok po kroku (GitHub Pages)

1. **Zaloz repozytorium** na GitHub, np. `atlas-biecz`.
   Twoj adres Pages bedzie wtedy: `https://TWOJA-NAZWA.github.io/atlas-biecz`

2. **Ustaw poprawny `id`** w info.json (wazne — bez tego kafle sie nie zaladuja).
   W terminalu, w tym folderze:
   ```bash
   ./set-id.sh https://TWOJA-NAZWA.github.io/atlas-biecz
   ```
   (na Windows bez basha mozesz recznie otworzyc `biecz_1_6/info.json`
   i wpisac w polu `"id"` wartosc `https://TWOJA-NAZWA.github.io/atlas-biecz/biecz_1_6`)

3. **Wgraj folder `biecz_1_6/`** do repozytorium (przez `git push` albo
   przyciskiem "Add file → Upload files" na stronie GitHub). Plik `set-id.sh`
   i `README.md` mozesz wgrac lub nie — nie sa potrzebne na serwerze.

4. **Wlacz Pages**: repozytorium → Settings → Pages →
   Source: *Deploy from a branch* → Branch: `main`, folder `/ (root)` → Save.
   Odczekaj 1–2 min.

5. **Sprawdz** w przegladarce, ze otwiera sie JSON:
   ```
   https://TWOJA-NAZWA.github.io/atlas-biecz/biecz_1_6/info.json
   ```

6. **Wczytaj w Allmaps**: wejdz na https://editor.allmaps.org i wklej powyzszy
   URL do `info.json`. Mapa sie zaladuje. Dalej:
   - **Mask** — obrysuj sam obszar mapy (pomijajac legendy/tabele/marginesy),
   - **Georeference** — stawiaj punkty kontrolne (rynek, kolegiata, skrzyzowania,
     granice dzialek) na obrazie i na podkladzie wspolczesnym,
   - **Export** — pobierz *Georeference Annotation* (to Twoj wynik georeferencji).

## Uwaga o rozdzielczosci

Raster z PDF ma 3267 x 2776 px (reprodukcja przy ok. 150 ppi, "skala
reprodukcji 40%"). Do prototypu jest dobry, ale jesli bedziesz chciala wyzsza
dokladnosc punktow kontrolnych, najlepszy bylby skan oryginalu w 400–600 dpi.
Z tego PDF wiecej pikseli sie nie wyciagnie — to jest pelna rozdzielczosc
wstawionego obrazu.

## Gdybys chciala powtorzyc dla innej planszy AHMP

```bash
# 1. zobacz, co jest w PDF:
pdfimages -list PLIK.pdf
# 2a. jesli jest jeden duzy wstawiony raster — wyciagnij bezstratnie:
pdfimages -all PLIK.pdf surowy
convert surowy-000.* -colorspace sRGB -depth 8 mapa.tif
# 2b. albo jesli mapa jest wektorowa/mieszana — rasteryzuj:
pdftoppm -r 400 -tiff -tiffcompression lzw PLIK.pdf mapa
# 3. wygeneruj IIIF:
vips dzsave mapa.tif NAZWA_FOLDERU --layout iiif3 --id "https://TWOJA-NAZWA.github.io/REPO" --tile-size 256
```
