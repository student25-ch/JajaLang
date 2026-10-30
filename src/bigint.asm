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

extern arena_alloc
extern arena_ptr
section .text
global bigint_new
global bigint_mul
global bigint_add

bigint_new:
    push rbx
    mov rbx,rdi
    mov rdi,16
    call arena_alloc
    mov [rax],rbx
    pop rbx
    ret

bigint_mul:
    xor rax,rax
    ret

bigint_add:
    xor rax,rax
    ret
