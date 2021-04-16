#!/usr/bin/env bash

mix deps.get --only prod
MIX_ENV=prod mix compile
# MIX_ENV=prod mix run priv/repo/seeds.exs

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

rm -rf "_build"
MIX_ENV=prod mix release
