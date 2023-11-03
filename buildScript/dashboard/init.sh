#!/bin/bash

# Just support MetaCubexd :)
# Now you can use metacubexd or Yacd-meta
DASH_REPO="$1"
[ -z "$DASH_REPO" ] && DASH_REPO="metacubexd"
DEST_DIR="Dash-${DASH_REPO}"

pnpm -v || exit 1

pushd ..


if [ ! -d "$DASH_REPO" ]; then
  git clone https://github.com/MetaCubeX/${DASH_REPO}.git --branch main || exit 1
fi

pushd ${DASH_REPO}/
  git checkout main
  git pull https://github.com/MetaCubeX/${DASH_REPO}.git main
  mkdir -p $DEST_DIR
  pnpm install
  pnpm build --outDir $DEST_DIR || exit 1

  zip -r dashboard.zip $DEST_DIR -9
popd

popd

cp ../${DASH_REPO}/dashboard.zip app/src/main/assets/dashboard.zip || exit 1
echo ">> install $DASH_REPO to  app/src/main/assets/dashboard.zip"
