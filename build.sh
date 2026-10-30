#!/bin/bash
set -eu

echo "========================================="
echo "JajaLang / JajaOS Build Script"
echo "Copyright (C) 2026 student25‑ch"
echo "========================================="

mkdir -p build

nasm -f elf64 -O3 src/jaa.asm -o build/jaa.o
nasm -f elf64 -O3 src/lexer.asm -o build/lexer.o
nasm -f elf64 -O3 src/parser.asm -o build/parser.o
nasm -f elf64 -O3 src/import.asm -o build/import.o
nasm -f elf64 -O3 src/alloc.asm -o build/alloc.o
nasm -f elf64 -O3 src/thread.asm -o build/thread.o
nasm -f elf64 -O3 src/symbol.asm -o build/symbol.o
nasm -f elf64 -O3 src/gen.asm -o build/gen.o
nasm -f elf64 -O3 src/data.asm -o build/data.o
nasm -f elf64 -O3 src/bss.asm -o build/bss.o
nasm -f elf64 -O3 src/error_report.asm -o build/error_report.o
nasm -f elf64 -O3 src/fileio.asm -o build/fileio.o
nasm -f elf64 -O3 src/bigint.asm -o build/bigint.o

echo "🔗 Linking jaa compiler"
ld \
build/jaa.o \
build/lexer.o \
build/parser.o \
build/import.o \
build/alloc.o \
build/thread.o \
build/symbol.o \
build/gen.o \
build/data.o \
build/bss.o \
build/error_report.o \
build/fileio.o \
build/bigint.o \
-o jaa

echo "✅ Build done! Run: ./jaa test.j"
