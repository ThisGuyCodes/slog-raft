#!/bin/bash
set -euo pipefail

rm -rf testing.go *_test.go fuzzy

go install golang.org/x/tools/cmd/goimports@latest
goimports -w -local 'github.com/hashicorp'

go mod edit -module github.com/thisguycodes/raft
go mod edit -go 1.21
go mod tidy
go build
