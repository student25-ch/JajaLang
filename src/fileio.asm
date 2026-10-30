; JajaLang / JajaOS
; Copyright (C) 2026 student25‑ch
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.

extern file_buf
section .text
global read_source_file

read_source_file:
    mov rax,2
    xor rsi,rsi
    xor rdx,rdx
    syscall
    cmp rax,0
    jl read_fail
    mov r8,rax

    mov rax,0
    mov rdi,r8
    mov rsi,file_buf
    mov rdx,16384
    syscall

    mov rax,3
    mov rdi,r8
    syscall
    xor rax,rax
    ret
read_fail:
    mov rax,1
    ret
