#!/usr/bin/env bash

rm -rf dist web
mkdir dist
cd dist
git clone https://github.com/excalidraw/excalidraw.git
cd excalidraw
npm install
npm run-script build
cd ../..
mv dist/excalidraw/build web

cd web
mv index.html _index.html

zip ../dist/main.go.zip -q -r *

cd ..

go build -o dist/excalidrawbin main.go

cat dist/main.go.zip >> dist/excalidrawbin

zip -q -A dist/excalidrawbin

mv dist/excalidrawbin ~/bin/excalidraw

