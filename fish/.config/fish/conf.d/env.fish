

# =============== go PATH config =============
set -x GOPATH "$HOME/go"
set -x GO111MODULE on
set -x GOROOT "/usr/lib/go"

set -x PATH "$PATH:$GOPATH/bin:$GOROOT/bin"
