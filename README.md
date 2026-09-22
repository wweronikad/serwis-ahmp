# serwis-ahmp

Kafle IIIF (Image API 3.0, poziom 0) i adnotacje georeferencyjne Allmaps dla map Atlasu Historycznego Miast Polskich, wykorzystywane przez serwis [`serwis-ahmp-infrastruktura`](https://github.com/wweronikad/serwis-ahmp-infrastruktura).

## Zawartość

| Ścieżka | Zawartość |
|---|---|
| `<mapa>/info.json` + `<mapa>/<region>,<region>,<szer>,<wys>/<rozmiar>/0/default.jpg` | kafle IIIF danej mapy (jeden katalog na mapę, nazwany identyfikatorem mapy z `cities.js`) |
| `adnotacje/<miasto>/<mapa>.json` | adnotacje georeferencyjne Allmaps (maska, punkty kontrolne) dla danej mapy |

Repozytorium jest publikowane przez GitHub Pages pod adresem `https://wweronikad.github.io/serwis-ahmp/`; część map (przekraczających limit 1 GB Pages) jest pobierana bezpośrednio z `raw.githubusercontent.com`.

Kafle wygenerowano skryptem `map_to_iiif.py` z repozytorium `serwis-ahmp-infrastruktura` (skanów PDF/JPG poszczególnych zeszytów Atlasu).
