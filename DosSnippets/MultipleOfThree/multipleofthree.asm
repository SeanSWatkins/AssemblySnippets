; Sean Watkins - 54142962
  bits 16
  org 0x100

start:
; clear the screen, change the color, move the cursor and start the loop
      call cls
      call changedispcolor
      call movecursor
      jmp  mainloop
      call stop

stop:
    int 20h

mainloop:
; loop prints out the input request, waits for the input and then starts the comparisons
    call printinputreq
    call getinput
    call comparewithzero

cls:
; clears the screen
    mov ah, 0
    int 10h
    ret

changedispcolor:
; Change the display and cursor color
    xor  al, al
    mov  ah, 09
    mov  cx, 5000
    mov  bl, 1Fh
    int  10h
    ret

movecursor:
; Move the cursor to position 0, 10
    mov  ah, 2
    mov  bh, 0
    mov  dl, 0
    mov  dh, 10
    int  10h
    xor  dh,dh  ; cleaning up after myself
    ret


printinputreq:
; print the request for input
    mov	ah, 09
; provided I don't use the bl register again this should persist for the duration of this application
    mov bl, 1Fh
    mov	dx, inputprompt
    int	21h
    xor dx, dx ; more clean up
    ret

getinput:
; wait for input from the keyboard, leave it in the al register
    mov ah, 01
    int 21h
    ret

comparewithzero:
    cmp al, 30h     ;compare input which is in al with 0
    jl printstars   ;if value is less than 0 print the starts
    call comparewithnine

comparewithnine:
    cmp al, 39h           ;compare input which is in al with 9
    jle checkifdivbythree   ;if value is less than or equal to 9, move onto division check
    jg printstars         ;else print the error

; Checks if the number entered is divisible by three
checkifdivbythree:
    xor ah, ah
    mov bl, 3
    div bl
    cmp ah, 0
    call printnewline
    jg  printnotdiv
    je  printdiv

printstars:
    mov ah, 09
    mov dx, stars
    int 21h
    call printnewline
    jmp mainloop ;if the input was less than 0 or greater than 9, we must loop (note: while loops seem to just be indirect recursive methods)

; outputs the message for negative result
printnotdiv:
    mov dx, outputerrormsg
    mov ah, 09
    int 21h
    call stop

; outputs the message for positive result
printdiv:
    mov dx, outputmsg
    mov ah, 09
    int 21h
    call stop

; utility function to print a few new lines
printnewline:
    mov ah, 09
    mov dx, crlf
    int 21h
    ret

section .data
; 13, 10 is a newline character
inputprompt: db 'Please enter number from 1 - 9', 13, 10, '$'
outputmsg: db 'Number if a multiple of 3', 13, 10, '$'
outputerrormsg: db 'Number is not a multiple of 3', 10, 13, '$'
stars: db '**', 0ah, 0dh, '$'
crlf: db 13,10,13,10,'$'
