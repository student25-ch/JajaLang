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

section .data
global welcome_msg
global err0
global err1
global err2
global err3
global err4
global err5
global err6

welcome_msg db "Jaja Compiler running",0xA,0
err0 db "✅ No error",0xA,0
err1 db "❌ Lexer error",0xA,0
err2 db "❌ Parser error",0xA,0
err3 db "❌ Codegen error",0xA,0
err4 db "❌ Memory error",0xA,0
err5 db "❌ Pi overflow",0xA,0
err6 db "❌ Cannot open file",0xA,0
