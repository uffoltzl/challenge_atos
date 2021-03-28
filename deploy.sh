#!/bin/sh
# cd greemote
# npm i
# npm run build
# cd ..
# firebase deploy
cd flutter_app
flutter build web
cd ..
firebase deploy