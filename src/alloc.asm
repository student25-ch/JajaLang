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

extern arena_ptr
section .text
global arena_start
global arena_alloc
global arena_end

ARENA_SIZE equ 1024*1024

arena_start:
    mov rax,9
    mov rdi,0
    mov rsi,ARENA_SIZE
    mov rdx,3
    mov r10,0x22
    mov r8,-1
    mov r9,0
    syscall
    cmp rax,0
    jz arena_fail
    mov [arena_ptr],rax
    xor rax,rax
    ret
arena_fail:
    mov rax,4
    ret

arena_alloc:
    mov rax,[arena_ptr]
    add [arena_ptr],rdi
    ret

arena_end:
    ret
