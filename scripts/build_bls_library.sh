GOPATH=$(go env GOPATH)
BLS_REPO_PATH="${GOPATH}"/src/github.com/xdustinface/bls-signatures

# Install packages for bindings
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/lint/golint

# Cleaning previous build
rm -rf "${BLS_REPO_PATH}"
mkdir -pv "${GOPATH}"/github.com/dashpay/

# Cloning bls repo and fetching dependencies
git clone --depth=1 --branch=develop --single-branch https://github.com/xdustinface/bls-signatures.git "$BLS_REPO_PATH"
cd "$BLS_REPO_PATH"
git submodule update --init --recursive

# Build and install the bindings
mkdir build
cd build
cmake ../
cmake --build . -- -j 6
sudo make install
