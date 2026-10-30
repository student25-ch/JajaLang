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

; JajaLang Compiler - Main entry
extern input_buf
extern lexer_main
extern parser_main
extern error_report
extern read_source_file
extern gen_code

section .text
global _start

_start:
    cmp rdi, 2
    jne no_arg

    mov rsi, [rsi + 8]
    call read_source_file
    test rax, rax
    jnz file_fail

    call lexer_main
    test rax, rax
    jnz parse_fail

    call parser_main
    test rax, rax
    jnz parse_fail

    call gen_code
    test rax, rax
    jnz gen_fail

    mov rax, 60
    mov rdi, 0
    syscall

no_arg:
    mov rdi, 6
    call error_report
    jmp exit
file_fail:
    mov rdi, 6
    call error_report
    jmp exit
parse_fail:
    mov rdi, 2
    call error_report
    jmp exit
gen_fail:
    mov rdi, 3
    call error_report
exit:
    mov rax, 60
    mov rdi, 1
    syscall
