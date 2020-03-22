.model small
.stack 100h
.data
pos1 db 31h 
pos2 db 32h 
pos3 db 33h
pos4 db 34h
pos5 db 35h
pos6 db 36h
pos7 db 37h
pos8 db 38h
pos9 db 39h
nextline db 10,13,"$"
msg db "Player 1(X) AND Player 2(Y)$"
askpos db "On Which Position You Want To Mark$"
welcomemsg db 32,32,32,32,32,32,32,32,32,32,32,32,"Welcome To TIC TAC TOE$"
invalid db 32,32,32,32,32,32,32,32,"YOU HAVE ENTERED AN INVALID POSITION$"
check db 1
plcebounded db 32,32,32,"This place is already bounded$"
winmsg db 32,32,32,"WIN THE GAME !$"
drawmsg db 32,32,32,"GAME DRAWN!!! $"
drawcounter db 30h
winner db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,welcomemsg;display welcome msg
    int 21h
    lea dx,nextline
    int 21h
    lea dx,nextline
    int 21h
    lea dx,msg
    int 21h
    lea dx,nextline
    int 21h
    lea dx,nextline
    int 21h
    inputagainx:
    jmp makeboard
    top:
    inc drawcounter
     inc check
    lea dx,askpos
    int 21h
    lea dx,nextline
    int 21h
    mov ah,1;taking position input X
    int 21h;//       //       //
    cmp al,31h
    je asignxtopos1
    cmp al,32h
    je asignxtopos2
    cmp al,33h
    je asignxtopos3
    cmp al,34h
    je asignxtopos4
    cmp al,35h
    je asignxtopos5
    cmp al,36h
    je asignxtopos6
    cmp al,37h
    je asignxtopos7
    cmp al,38h
    je asignxtopos8
    cmp al,39h
    je asignxtopos9
    jne invalidinputx
    
    nextturn:
    inc drawcounter
    inputagainy:
    inc check
    ;second player input
    lea dx,nextline
    int 21h
    mov ah,9
    lea dx,nextline
    int 21h
    lea dx,askpos
    int 21h
    lea dx,nextline
    int 21h
    mov ah,1;taking position input Y
    int 21h;//      //       //
    cmp al,31h
    je asignytopos1
    cmp al,32h
    je asignytopos2
    cmp al,33h
    je asignytopos3
    cmp al,34h
    je asignytopos4
    cmp al,35h
    je asignytopos5
    cmp al,36h
    je asignytopos6
    cmp al,37h
    je asignytopos7
    cmp al,38h
    je asignytopos8
    cmp al,39h
    je asignytopos9
    jne invalidinputy
    ;end
    
    
    
    
    
    
    
    
     
     
      
      
      
      
      
      
      
      
      
      
      
      
     ;asigning X to positions
      asignxtopos1:
      cmp pos1,31h
      jne placebounded
      mov pos1,58h
      
      jmp makeboard
      
      
      asignxtopos2:
       cmp pos2,32h
      jne placebounded
      mov pos2,58h
      
      jmp makeboard
      
      
      asignxtopos3:
       cmp pos3,33h
      jne placebounded
      mov pos3,58h
      
      jmp makeboard
      
      
      asignxtopos4:
       cmp pos4,34h
      jne placebounded
      mov pos4,58h
      
      jmp makeboard
      
      
      asignxtopos5:
       cmp pos5,35h
      jne placebounded
      mov pos5,58h
      
      jmp makeboard
      
      
      asignxtopos6:
       cmp pos6,36h
      jne placebounded
      mov pos6,58h
      
      jmp makeboard
      
      
      asignxtopos7:
       cmp pos7,37h
      jne placebounded
      mov pos7,58h
      
      jmp makeboard
      
      
      asignxtopos8:
       cmp pos8,38h
      jne placebounded
      mov pos8,58h
      
      jmp makeboard
      
      
      asignxtopos9:
       cmp pos9,39h
      jne placebounded
      mov pos9,58h
      
      jmp makeboard
      ; end of asigning X to positions
      
      
      
      
      
      
      
      
      
      
      
      
      ;asigning Y to positions
      asignytopos1:
       cmp pos1,31h
      jne placebounded
      mov pos1,59h
      
      jmp makeboard
      
      
      asignytopos2:
       cmp pos2,32h
      jne placebounded
      mov pos2,59h
      
      jmp makeboard
      
      
      asignytopos3:
       cmp pos3,33h
      jne placebounded
      mov pos3,59h
      
      jmp makeboard
      
      
      asignytopos4:
       cmp pos4,34h
      jne placebounded
      mov pos4,59h
      
      jmp makeboard
      
      
      asignytopos5:
       cmp pos5,35h
      jne placebounded
      mov pos5,59h
      
      jmp makeboard
      
      
      asignytopos6:
       cmp pos6,36h
      jne placebounded
      mov pos6,59h
      
      jmp makeboard
      
      
      asignytopos7:
       cmp pos7,37h
      jne placebounded
      mov pos7,59h
      
      jmp makeboard
      
      
      asignytopos8:
       cmp pos8,38h
      jne placebounded
      mov pos8,59h
      
      jmp makeboard
      
      
      asignytopos9:
       cmp pos9,39h
      jne placebounded
      mov pos9,59h
      
      jmp makeboard
      ; ed of asigning X to positions
      
      
      
      
      
      
      
      
      
      
      
       
      
     
     
     
     
      
      
      
      
      
     
     
        
      
     
     
     
     
     
     
    
    ;making board
    makeboard:
    ;row1
    mov al,pos1
    cmp al,pos2           
    je  checkpos3forrow1
    jne checkcol1
    checkpos3forrow1:
    cmp al,pos3
    mov winner,al
    je win
    ;col1
    checkcol1:
    mov al,pos1
    cmp al,pos4
    je checkpos7forcol1
    jne maindiagnol
    checkpos7forcol1:
    cmp al,pos7 
    mov winner,al
    je win
    ;main diagnol
    maindiagnol:
    mov al,pos1
    cmp al,pos5
    je checkpos9formaindiagnol
    jne col2 
    checkpos9formaindiagnol:
    cmp al,pos9
    mov winner,al
    je win
    ;col2
    col2:
    mov al,pos2
    cmp al,pos5
    je checkpos8forcol2
    jne col3
    checkpos8forcol2:
    cmp al,pos8 
    mov winner,al
    je win
    ;col3
    col3:
    mov al,pos3
    cmp al,pos6
    je checkpos9forcol3
    jne nonmaindiagnol
    checkpos9forcol3:
    cmp al,pos9 
    mov winner,al
    je win
    ;non-main diagnol
    nonmaindiagnol:
    mov al,pos3
    cmp al,pos5
    je checkpos7fornonmaindiagnol
    jne row2
    checkpos7fornonmaindiagnol:
    cmp al,pos7
    mov winner,al
    je win
    ;row2
    row2:
    mov al,pos4
    cmp al,pos5
    je checkpos6forrow2
    jne row3
    checkpos6forrow2:
    cmp al,pos6
    mov winner,al
    je win
    ;row3 
    row3:
    mov al,pos7
    cmp al,pos8
    je checkpos9forrow3 
    jne checkdraw
    checkpos9forrow3:
    cmp al,pos9
    mov winner,al
    je win            
    ;drawcheck
    checkdraw:
    mov al,pos1
    cmp al,31h
    jne check2
    je board
    check2:
    mov al,pos2
    cmp al,32h
    jne check3
    je board 
    check3:
    mov al,pos3
    cmp al,33h
    jne check4
    je board
    check4:
    mov al,pos4
    cmp al,34h
    jne check5
    je board
    check5:
    mov al,pos5
    cmp al,35h
    jne check6
    je board 
    check6:
    mov al,pos6
    cmp al,36h
    jne check7
    je board
     check7:
    mov al,pos7
    cmp al,37h
    jne check8
    je board
    check8:
    mov al,pos8
    cmp al,38h
    jne check9
    je board
    check9:
    mov al,pos9
    cmp al,39h
    je board
    draw: 
    mov ah,9
    lea dx,nextline
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    mov ah,2
    mov dl,pos1
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos2
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos3
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
    mov ah,2
    mov dl,pos4
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos5
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos6
    int 21h
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h 
    mov ah,2
    mov dl,pos7
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos8
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos9
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h
    mov ah,9
    lea dx ,drawmsg
    int 21h
    jmp exit
    
    
    
    
    
    
    
    
    
    
    
    
           
               
                 
    
    
     

    
    
    board:
    mov ah,9
    lea dx,nextline
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    mov ah,2
    mov dl,pos1
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos2
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos3
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
    int 21h
    mov ah,2
    mov dl,pos4
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos5
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos6
    int 21h
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h 
    mov ah,2
    mov dl,pos7
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos8
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos9
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h
    mov al,check
    and al,1
    je nextturn
    jmp top
    
    
    
     
     
     
     
      
      placebounded:
      inc check
      mov ah,9
      lea dx,plcebounded
      int 21h 
      jmp makeboard
      
      
      
        
        
        win:
    mov ah,9
    lea dx,nextline
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    int 21h;next line
    mov ah,2
    mov dl,pos1
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos2
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos3
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
    mov ah,2
    mov dl,pos4
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos5
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos6
    int 21h
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h 
    mov ah,2
    mov dl,pos7
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos8
    int 21h
    mov dl,32
    int 21h;space
    int 21h;space
    mov dl,pos9
    int 21h 
    mov ah,9
    lea dx,nextline
    int 21h
     mov ah,9
    lea dx,nextline
    int 21h
    mov ah,2 
    mov dl,32
    int 21h
    mov dl,al
    int 21h
    mov dl,winner
    int 21h
    mov dl,32
    int 21h
    mov dl,32
    int 21h
    mov dl,32
    int 21h
        mov ah,9
        lea dx,winmsg
        int 21h
        jmp exit
      
      
     invalidinputx:
     mov check,0
     mov ah,9
     lea dx,invalid
     int 21h
     jmp inputagainx
     
     
     
     invalidinputy:
     inc check
     mov ah,9
     lea dx,invalid
     int 21h
     jmp inputagainy
     
     exit:
    mov ah,4ch
    int 21h
    main endp
end
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             