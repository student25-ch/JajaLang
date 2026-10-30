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

extern err0,err1,err2,err3,err4,err5,err6
section .text
global error_report

error_report:
    cmp rdi,0
    mov rsi,err0
    je print_err
    cmp rdi,1
    mov rsi,err1
    je print_err
    cmp rdi,2
    mov rsi,err2
    je print_err
    cmp rdi,3
    mov rsi,err3
    je print_err
    cmp rdi,4
    mov rsi,err4
    je print_err
    cmp rdi,5
    mov rsi,err5
    je print_err
    cmp rdi,6
    mov rsi,err6
    je print_err
print_err:
    push rsi
    xor rdx,rdx
count_len:
    cmp byte [rsi],0
    jz len_done
    inc rdx
    inc rsi
    jmp count_len
len_done:
    pop rsi
    mov rax,1
    mov rdi,1
    syscall
    ret
