#!/bin/sh
# cd greemote
# npm i
# npm run build
# cd ..
# firebase deploy
cd flutter_app
flutter build web --web-renderer=html
cd ..
firebase deploy