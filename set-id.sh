#!/usr/bin/env bash
# Ustawia poprawne pole "id" w info.json pod Twoj adres GitHub Pages.
# Uruchom TEN skrypt PRZED wgraniem folderu na GitHub (albo po wgraniu i ponownie zacommituj info.json).
#
# Uzycie:
#   ./set-id.sh <bazowy-URL-GitHub-Pages>
#
# Przyklad (uzytkownik "jankowalski", repozytorium "atlas-biecz"):
#   ./set-id.sh https://jankowalski.github.io/atlas-biecz

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Uzycie: $0 <bazowy-URL-GitHub-Pages>"
  echo "Przyklad: $0 https://jankowalski.github.io/atlas-biecz"
  exit 1
fi

BASE="${1%/}"           # usun ewentualny koncowy ukosnik
ID="${BASE}/biecz_1_6"  # nazwa folderu z kaflami

python3 - "$ID" <<'PY'
import json, sys
path = "biecz_1_6/info.json"
with open(path, encoding="utf-8") as f:
    data = json.load(f)
data["id"] = sys.argv[1]
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
print("Ustawiono id =", sys.argv[1])
PY

echo
echo "Gotowe. Sprawdz, ze po wgraniu otworzy sie w przegladarce:"
echo "  ${ID}/info.json"
echo "Ten URL wklejasz potem w Allmaps Editor (https://editor.allmaps.org)."
