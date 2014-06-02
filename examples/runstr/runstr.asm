                .model  tiny

                .code

_Start:
                pop     ax

                mov     bx, 80 * 2
                mul     bx

                mov     bx, ax
                add     bx, 80 * 2

                mov     cx, 0xB800
                mov     es, cx

                mov     dx, 0

                mov     cx, 0xFFFF
@beginLine:

                mov     di, ax

@printChar:
                mov     byte ptr es:di, dl
                inc     dl
                inc     di
                mov     byte ptr es:di, dh
                inc     dh
                and     dh, 0x0F
                inc     di

                cmp     di, bx
                jb      @printChar

                loop    @beginLine

                retf

                end     _Start
