[org 0x0100]

jmp start

snakeBodyPositions:dw 2460,2462,2464,2466,2468,2470,2472,2474,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;first is head
snakeNumberOfBodyParts:dw 8
AppleLocation:dw 2446
BorderOffsets:dw 960,962,964,966,968,970,972,974,976,978,980,982,984,986,988,990,992,994,996,998,1000,1002,1004,1006,1008,1010,1012,1014,1016,1018,1020,1022,1024,1026,1028,1030,1032,1034,1036,1038,1040,1042,1044,1046,1048,1050,1052,1054,1056,1058,1060,1062,1064,1066,1068,1070,1072,1074,1076,1078,1080,1082,1084,1086,1088,1090,1092,1094,1096,1098,1100,1102,1104,1106,1108,1110,1112,1114,1116,1118,1278,1438,1598,1758,1918,2078,2238,2398,2558,2718,2878,3038,3198,3358,3518,3678,3838,3998,3840,3842,3844,3846,3848,3850,3852,3854,3856,3858,3860,3862,3864,3866,3868,3870,3872,3874,3876,3878,3880,3882,3884,3886,3888,3890,3892,3894,3896,3898,3900,3902,3904,3906,3908,3910,3912,3914,3916,3918,3920,3922,3924,3926,3928,3930,3932,3934,3936,3938,3940,3942,3944,3946,3948,3950,3952,3954,3956,3958,3960,3962,3964,3966,3968,3970,3972,3974,3976,3978,3980,3982,3984,3986,3988,3990,3992,3994,3996,1120,1280,1440,1600,1760,1920,2080,2240,2400,2560,2720,2880,3040,3200,3360,3520,3680
GamePlayStatus:dw 1;1 for playing 0 for game end ;2 for menu; 3 for esc
score:dw 0
lives:dw 3
difficultyOptionSelected: dw 1 ; 1 easy 2 medium 3 hard
direction:dw 2;2 left

clearScreen:
    push es
    push ax
    push cx
    push di

    mov ax,0xb800
    mov es,ax
    mov di,0
    mov ax,0x0720
    mov cx,2000

    cld 
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
ret

slowPrinting:
    push cx
    push dx
    mov cx,0xFFFF
    slowPrintingLoop:
    Loop slowPrintingLoop
    pop dx
    pop cx
ret

slowPrintingForAnimation:
    push cx
    push dx
    mov cx,0xFF
    slowPrintingLoop2:
    Loop slowPrintingLoop2
    pop dx
    pop cx
ret

animationClear:
    push es
    push ax
    push di

    mov ax,0xb800
    mov es,ax
    mov di,0
    mov ax,0x0720

    animateloop:
        mov [es:di],ax
        add di,2
        call slowPrintingForAnimation
        cmp di,4000
    jne animateloop    
    

    pop di
    pop ax
    pop es
ret

PrintMyName:
    push es 
    push ax 
    push cx 
    push si 
    push di 
    
    jmp doooo
    myName:dw 'Developed by : Bilal Ahmad';26
    doooo:
    mov  ax, 0xb800 
    mov  es, ax
    mov si,myName
    mov di,3578
    mov cx,26
    mov ah,0x09
    
    cld 
    nextcharMyName:
        lodsb                 
        stosw                 
    loop nextcharMyName       
 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  es 

ret

continue:
    push es 
    push ax 
    push cx 
    push si 
    push di 
    
    jmp doo
    PressanyKey:dw 'Press any key to continue...';28
    doo:
    mov  ax, 0xb800 
    mov  es, ax
    mov si,PressanyKey
    mov di,3938
    mov cx,28
    mov ah,0x07
    
    cld 
    nextcharPressanykey:
        lodsb                 
        stosw                 
    loop nextcharPressanykey  
 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  es 

ret

IntroSnakeGame:
    push es
    push di
    push ax

    mov ax,0xb800
    mov es,ax
    mov ax,0xE620

    ;S of Snake
    mov di,200
    SnakeSUpper:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,180
    jne SnakeSUpper

    SnakeSdown1:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,820
    jne SnakeSdown1
    
    SnakeSright:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,840
    jne SnakeSright

    SnakeSdown2:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1480
    jne SnakeSdown2

    SnakeSleft:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1458
    jne SnakeSleft


    ;N of Snake
    mov di,1484
    Nleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,204
    jne Nleft
    mov [es:di],ax
    add di,2

    Nmiddle:
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,1502
    jne Nmiddle
    mov [es:di],ax
    mov di,1504
    Nright:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,64
    jne Nright


    ;A of Snake
    mov di,1508
    SnakeAleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,228
    jne SnakeAleft
    SnakeAup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,252
    jne SnakeAup
    SnakeAright:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1692
    jne SnakeAright
    mov di,1050
    SnakeAmiddle:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1028
    jne SnakeAmiddle



    ;K of Snake
    mov di,256
    SnakeKleft:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1696
    jne SnakeKleft
    mov di,898
    SnakeKUpper:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        sub di,158 
        call slowPrinting
        cmp di,118
    jne SnakeKUpper
    mov di,1062
    SnakeKLower:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,1718
    jne SnakeKLower

    ;E of Snake
    mov di,280
    SnakeEleft:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1720
    jne SnakeEleft
    mov di,282
    SnakeEup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,300
    jne SnakeEup

    mov di,922
    SnakeEmiddle:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,940
    jne SnakeEmiddle
    mov di,1562
    SnakeEdown:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,1580
    jne SnakeEdown


    ;G of Game
    mov di,1960
    GameGUpper:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1940
    jne GameGUpper

    GameGdown:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,2900
    jne GameGdown
    
    GameGleft:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2920
    jne GameGleft

    GameGup:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,2440
    jne GameGup

    GameGleft2:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,2428
    jne GameGleft2

    ;A of Game
    mov di,2924
    GameAleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,1964
    jne GameAleft
    GameAup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,1988
    jne GameAup
    GameAright:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3108
    jne GameAright
    mov di,2466
    GameAmiddle:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,2444
    jne GameAmiddle

    ;M of game
    mov di,2952
    GameMleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,1992
    jne GameMleft
    GameMMiddleLeft:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,2976
    jne GameMMiddleLeft
    mov [es:di],ax
    sub di,158
    GameMMiddleRight:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        call slowPrinting
        sub di,158
        cmp di,2038
    jne GameMMiddleRight
    mov [es:di],ax
    add di,2
    GameMright:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3160
    jne GameMright


    ;E of Game
    mov di,2044
    GameEleft:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3164
    jne GameEleft
    mov di,2046
    GameEup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2060
    jne GameEup

    mov di,2526
    GameEmiddle:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2540
    jne GameEmiddle
    mov di,3006
    GameEdown:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,3020
    jne GameEdown

    call PrintMyName
    call continue

    pop ax
    pop di
    pop es
ret

loading:
    pusha
    mov ax,0xb800
    mov es,ax
    mov di,1480
    mov cx,40
    elel:
        mov word[es:di],0x4420
        mov word[es:di+160],0x3320
        mov word[es:di+320],0x3320
        mov word[es:di+480],0x4420
        add di,2
        call slowPrinting
        call slowPrinting
    loop elel
    popa
ret


;main working
checkBoundaryCollision:
    pusha

    mov ax,[snakeBodyPositions];head in ax
    
    mov cx,194
    mov bx,BorderOffsets
    loopForBoundaryChecking:
        cmp [bx],ax
        je headCollide
        add bx,2
    loop loopForBoundaryChecking
    jmp exitFromBoundaryCheck
    headCollide:
        mov word[GamePlayStatus],0
        sub word[lives],1
        push 1140
        call soundCollision
    exitFromBoundaryCheck:
    popa
ret

checkSnakeCollision:
    pusha
    mov bx,snakeBodyPositions
    mov ax,[bx]
    add bx,2
    mov cx,[snakeNumberOfBodyParts]
    dec cx
    checkSnakeCollisionLoop:
        cmp ax,[bx]
        je collideWithBody
        add bx,2
    loop checkSnakeCollisionLoop
    jmp exitFromCheckingBodyCollision
    collideWithBody:
        mov word[GamePlayStatus],0
        sub word[lives],1
        push 1140
        call soundCollision
    exitFromCheckingBodyCollision:
    popa
ret

GenerateRandNumber:
    pusha
	mov ax, 0
	add ax, 0
	add ax, bp
	add ax, ax
	add ax, cx
	add ax, dx
	add ax, si
	add ax, di
	add ax, [es:si]
	add ax, [cs:AppleLocation]
	add ax, sp
	xor dx, dx
	mov cx, 2714
	div cx
    add dx,1122
	shr dx, 1
	shl dx, 1
	mov ax, dx
	mov di, ax
	mov bx, [es:di]
	mov word[AppleLocation], ax
    popa
ret

Border:
    push dx
    push di
    push es


    mov ax,0xb800
    mov es,ax
    mov di,960
    mov ax,0x3320
    borderTop:
        mov [es:di],ax
        add di,2
        cmp di,1120
    jne borderTop

    borderLeft:
        mov [es:di],ax
        add di,160
        cmp di,3840
    jne borderLeft    

    borderBottom:
        mov [es:di],ax
        add di,2
        cmp di,4000
    jne borderBottom

    sub di,2
    borderRight:
        mov [es:di],ax
        sub di,160
        cmp di,1118
    jne borderRight


    pop es
    pop di
    pop ax
ret

CheckAppleEat:
    pusha
    mov ax,[AppleLocation]
    mov bx,[snakeBodyPositions]
    cmp ax,bx
    jne exitFromAppleCheck
    add word[score],10
    push 8888
    call sound
    call GenerateRandNumber
    call checkApplePosition
    call increaseSnakeLength 
    exitFromAppleCheck:
    popa
ret

ScoreAndLives:
    jmp PushAll

    SnakeGame:dw 'Snake Game';10
    LivesRemaining:dw 'Lives Remaining : ';18
    TotalScore:dw 'Total Score : ';14

    PushAll:
    push bp
    mov bp,sp
    push es
    push di
    push si
    push ax
    push bx
    push cx
    push dx
    mov  ax, 0xb800 
    mov  es,ax

    mov si,SnakeGame
    mov di,230
    mov cx,10
    mov ah,0x09
    
    cld 
    nextcharSnakeGame:
        lodsb                 
        stosw                 
    loop nextcharSnakeGame 

    mov si,LivesRemaining
    mov di,336
    mov cx,18
    mov ah,0x09
    
    cld 
    nextcharLivesRemaining:
        lodsb                 
        stosw                 
    loop nextcharLivesRemaining

    mov cx, [lives]
    cmp cx,0
    je zeroLife     
    mov dh, 4h
    mov dl,3
    nextposLives:
        mov [es:di], dx 
        add  di, 2     
    loop nextposLives 
    jmp scorePrinting
    zeroLife:
        mov dh,0x07
        mov dl,0x30
        mov [es:di],dx

    scorePrinting:
    mov si,TotalScore
    mov di,436
    mov cx,14
    mov ah,0x09
    
    cld 
    nextcharTotalScore:
        lodsb                 
        stosw                 
    loop nextcharTotalScore

    mov  ax, [score]     
    mov  bx, 10         
    mov  cx, 0          
    nextdigitScore:    
        mov  dx, 0      
        div  bx         
        add  dl, 0x30   
        push dx         
        inc  cx          
        cmp  ax, 0      
    jnz  nextdigitScore 
    nextposScore:
        pop  dx         
        mov  dh, 0x07  
        mov [es:di], dx 
        add  di, 2     
    loop nextposScore

    pop dx
    pop cx
    pop bx
    pop ax
    pop si
    pop di
    pop es
    pop bp
ret

PrintSnake:
    push es
    push di
    push cx
    push ax
    push dx
    mov ax,0xb800
    mov es,ax
    
    mov ax,0x4420;0x0E2A; >head
    mov bx,snakeBodyPositions
    mov di,[bx]
    mov [es:di],ax ; print head
    add bx,2
    mov ax,0x7720;0x072A; *body
    mov dx,0xE620
    mov cx,[snakeNumberOfBodyParts]
    dec cx
    PrintSnakeLoop:
        mov di,[bx]
        mov [es:di],ax
        add bx,2
        dec cx
        cmp cx,0
        je exitFromSnakePrinting
        mov di,[bx]
        mov [es:di],dx
        add bx,2
        dec cx
        cmp cx,0
    jne PrintSnakeLoop  

    exitFromSnakePrinting:
    pop dx
    pop ax
    pop cx
    pop di
    pop es
ret

moveSnake:
    push bp
    mov bp,sp
    push ax
    push bx
    push si
    push cx
    push dx
    mov bx,snakeBodyPositions
    mov cx,[snakeNumberOfBodyParts]
    dec cx ; to skip head
    mov si,cx
    shl si,1;now si is on last index

    ;check validations
    mov ax,[bx+2]
    add ax,2
    cmp ax,[bx]
    je checkRightSideMoment
    mov ax,[bx+2]
    sub ax,2
    cmp ax,[bx]
    je checkLeftSideMoment
    mov ax,[bx+2]
    add ax,160
    cmp ax,[bx]
    je checkDownsideMoment
    mov ax,[bx+2]
    sub ax,160
    cmp ax,[bx]
    je checkUpwardMoment
    checkRightSideMoment:
        cmp word[bp+4],2
        je ExitFromMoveSnake
    jmp moveSnakePart 
    checkLeftSideMoment:
        cmp word[bp+4],1
        je ExitFromMoveSnake
    jmp moveSnakePart
    checkUpwardMoment:
        cmp word[bp+4],3
        je ExitFromMoveSnake
    jmp moveSnakePart
    checkDownsideMoment:
        cmp word[bp+4],4
        je ExitFromMoveSnake
    jmp moveSnakePart

    moveSnakePart:
        mov dx,[bx+si-2]
        mov [bx+si],dx
        sub si,2
    loop moveSnakePart    


    mov ax,[bp+4]
    cmp ax,1
    je moveRight
    cmp ax,2
    je moveleft
    cmp ax,3
    je moveDown
    sub word[bx],160
    jmp ExitFromMoveSnake
    moveRight:
    add word[bx],2
    jmp ExitFromMoveSnake
    moveleft:
    sub word[bx],2
    jmp ExitFromMoveSnake
    moveDown:
    add word[bx],160

    ExitFromMoveSnake:
    pop dx
    pop cx
    pop si
    pop bx
    pop ax
    pop bp
ret 2

increaseSnakeLength:
    pusha

    mov bx,snakeBodyPositions
    mov si,[snakeNumberOfBodyParts]
    shl si,1
    mov dx,[bx+si-2]
    add dx,2
    mov [bx+si],dx
    add word[snakeNumberOfBodyParts],1
    popa
ret

PrintApple:
    push ax
    push di
    push es
    push cx
    push dx
    
    mov ax,0xb800
    mov es,ax
    mov di,[AppleLocation]
    mov ah,10001100b
    mov al,0x5
    mov [es:di],ax
    pop dx
    pop cx
    pop es
    pop di
    pop ax
ret

sound:
	push bp
	mov bp, sp
	push ax

	mov al, 182
	out 0x43, al
	mov ax, [bp + 4]   ; frequency
	out 0x42, al
	mov al, ah
	out 0x42, al
	in al, 0x61
	or al, 0x03
	out 0x61, al
    call slowPrinting
    call slowPrinting
    call slowPrinting
	in al, 0x61

	and al, 0xFC
	out 0x61, al

	pop ax
	pop bp
ret 2

soundCollision:
	push bp
	mov bp, sp
	pusha

	mov al, 182
	out 0x43, al
	mov ax, [bp + 4]   ; frequency
	out 0x42, al
	mov al, ah
	out 0x42, al
	in al, 0x61
	or al, 0x03
	out 0x61, al
    
    mov cx,20
    soundLong:
        mov dx,0xFFFF
        decDx:
            dec dx
        jnz decDx
    loop soundLong

	in al, 0x61
	and al, 0xFC
	out 0x61, al

	popa
	pop bp
ret 2

snakeReset:
    pusha
    mov word[snakeNumberOfBodyParts],8
    mov bx,snakeBodyPositions
    mov word[bx],2460
    mov word[bx+2],2462
    mov word[bx+4],2464
    mov word[bx+6],2466
    mov word[bx+8],2468
    mov word[bx+10],2470
    mov word[bx+12],2472
    mov word[bx+14],2474
    popa
ret

checkApplePosition:
    pusha
    checkAgain:
    mov ax,[AppleLocation];head in ax
    
    mov cx,194
    mov bx,BorderOffsets
    loopForBoundaryCheckingApple:
        cmp [bx],ax
        je headCollideApple
        add bx,2
    loop loopForBoundaryCheckingApple
    jmp checkSnake
    headCollideApple:
        call GenerateRandNumber
        jmp checkAgain
    checkSnake:
    mov bx,snakeBodyPositions
    mov ax,[AppleLocation]
    add bx,2
    mov cx,[snakeNumberOfBodyParts]
    checkSnakeCollisionLoopApple:
        cmp ax,[bx]
        je collideWithBodyApple
        add bx,2
    loop checkSnakeCollisionLoopApple
    jmp exitFromCheckingBodyCollisionApple
    collideWithBodyApple:
        call GenerateRandNumber
        jmp checkAgain
    exitFromCheckingBodyCollisionApple:
    popa
ret

difficultySpeedDelay:
    pusha

    mov cx,[difficultyOptionSelected]
    cmp cx,1
    je easyMode
    cmp cx,2
    je mediumMode

    ;hardMode
    call slowPrinting
    call slowPrinting
    call slowPrinting
    jmp retFromdiffdelay
    easyMode:
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
    jmp retFromdiffdelay
    mediumMode:
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
        call slowPrinting
    retFromdiffdelay:
    popa
ret

instructions:
    jmp pushAllinInstruction

    line1:db '*Use arrow Keys for movement of snake';37
    line2:db '*Press esc to exit the game';27
    line3:db '*Press p to pause game';22
    line4:db '*Score 10 will be given at each Apple eat';41
    line5:db '*A life will be deducted if the snake collide with its body or the border';73
    line6:db '*Do not press two or more direction keys at a time';50


    pushAllinInstruction:
    pusha

    mov  ax, 0xb800 
    mov  es, ax
    mov ah,0x07
    mov dh,04h
    mov dl,'*'
    mov si,line1
    mov di,0
    mov cx,37
    cld 
    nextcharline1:
        lodsb                 
        stosw                 
    loop nextcharline1 
    
    mov [es:0],dx

    mov si,line2
    mov di,160
    mov cx,27
    cld 
    nextcharline2:
        lodsb                 
        stosw                 
    loop nextcharline2 
     mov [es:160],dx

    mov si,line3
    mov di,320
    mov cx,22
    cld 
    nextcharline3:
        lodsb                 
        stosw                 
    loop nextcharline3 
    mov [es:320],dx


    mov si,line4
    mov di,480
    mov cx,41
    cld 
    nextcharline4:
        lodsb                 
        stosw                 
    loop nextcharline4 
    mov [es:480],dx
    mov si,line5
    mov di,640
    mov cx,73
    cld 
    nextcharline5:
        lodsb                 
        stosw                 
    loop nextcharline5  
    mov [es:640],dx


    mov si,line6
    mov di,800
    mov cx,50
    cld 
    nextcharline6:
        lodsb                 
        stosw                 
    loop nextcharline6
    mov [es:800],dx


    popa
ret

restart:
    pusha
    call snakeReset
    mov word[score],0
    mov word[lives],3
    mov word[direction], 2
    mov word[GamePlayStatus],1
    call GenerateRandNumber
    call checkApplePosition
    popa
ret

difficulty:
    jmp pushAllinDifficulty
    easy: db '1.Esay mode';11
    medium: db '2.medium mode';13
    Hard: db '3.Hard mode';11
    

    pushAllinDifficulty:
    pusha
    ;Printing
    mov  ax, 0xb800 
    mov  es, ax
    mov ah,0x07
    mov si,easy
    mov di,0
    mov cx,11
    cld 
    nextchareasy:
        lodsb                 
        stosw                 
    loop nextchareasy
    mov si,medium
    mov di,160
    mov cx,13
    cld 
    nextcharmedium:
        lodsb                 
        stosw                 
    loop nextcharmedium
    mov si,Hard
    mov di,320
    mov cx,11
    cld 
    nextcharHard:
        lodsb                 
        stosw                 
    loop nextcharHard


    mov ah,0x04
    mov si,menu4
    mov di,640
    mov cx,12
    cld 
    nextcharchoice:
        lodsb                 
        stosw                 
    loop nextcharchoice



    ;input
    Diffinput:
    xor ax, ax
	mov ah, 0
    int 0x16
    
    cmp ah, 0x2
    je diff1
    cmp ah,0x3
    je diff2
    cmp ah,0x4
    je diff3
    cmp ah,0x01
    je exitFromdiff
    jmp Diffinput

    diff1:
        mov word[difficultyOptionSelected],1
        jmp exitFromdiff
    diff2:
        mov word[difficultyOptionSelected],2
        jmp exitFromdiff
    diff3:
        mov word[difficultyOptionSelected],3
    exitFromdiff:
    popa
ret

ThanksForPlaying:
    jmp lastMssg
    mssg:db 'Thanks for playing the game' 
    lastMssg:
    pusha
    mov  ax, 0xb800 
    mov  es, ax
    mov ah,0x07
    mov si,mssg
    mov di,1960
    mov cx,27
    cld 
    nextcharthanks:
        lodsb                 
        stosw                 
    loop nextcharthanks
    mov al,'!'

    mov ah,0x04
    mov [es:di],ax
    mov ah,0x03
    mov [es:di+2],ax
    mov ah,0x02
    mov [es:di+4],ax


    popa

ret

TheEnd:
    pusha
	mov ax, 0xb800
	mov es, ax
	mov al, ' '
	mov ah, 0x44

	
	mov di, 1142
	mov cx, 7	
    theT:	
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop theT
	
	mov di, 1134
	mov cx, 9
    theT2:	
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop theT2
	
	mov di, 1156
	mov cx, 7
	mov ah, 0x66
    l3: 
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l3
	
	mov di, 1170
	mov cx, 7
    l4:
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l4
	
	
	mov di, 1636
	mov cx, 7
    l5:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l5
	
	mov di, 1190
	mov cx, 7
	mov ah, 0x33
    l6:
	    mov [es:di], ax
	    sub di, 2
	    call slowPrinting
	loop l6
	
	mov cx, 6
    l7:
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l7
	
	mov cx, 8	
    l8:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l8
	
	mov di, 1656
	mov cx, 8
    l9:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l9
	
	
    mov di, 1218
	mov cx, 7
	mov ah, 0x22
    l10:
	    mov [es:di], ax
	    sub di, 2
	    call slowPrinting
	loop l10
	
	mov cx, 6
    l11:
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l11
	
	mov cx, 8	
    l12:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l12
	
	mov di, 1684
	mov cx, 8
    l13:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l13
	mov di, 2184
	mov ah, 0x55
	mov cx, 7	
    l14:	
	    mov [es:di], ax
	    sub di, 160
	    call slowPrinting
	loop l14
	
	mov cx, 7
    l15:	
	    add di, 162
	    mov [es:di], ax
	    call slowPrinting
	loop l15
	
	add di, 2
	mov cx, 7	
    l16:	
	    mov [es:di], ax
	    sub di, 160
	    call slowPrinting
	loop l16
	
	add di, 166
	mov ah, 0x44
	mov cx, 7	
    l17:	
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l17
	
	mov di, 1248
	mov cx, 7
    l18:
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l18
	
	mov cx, 7	
    l19:	
	    mov [es:di], ax
	    add di, 160
	    call slowPrinting
	loop l19
	
	sub di, 160
	mov cx, 8	
    l20:	
	    mov [es:di], ax
	    sub di, 2
	    call slowPrinting
	loop l20
	
	
	mov di, 2570
	mov cx, 70
	mov ah, 0x11
    l21:	
	    mov [es:di], ax
	    add di, 2
	    call slowPrinting
	loop l21	
	

    mov si,TotalScore
    mov di,3580
    mov cx,14
    mov ah,0x09
    
    cld 
    nextcharTotalScore2:
        lodsb                 
        stosw                 
    loop nextcharTotalScore2

    mov  ax, [score]     
    mov  bx, 10         
    mov  cx, 0          
    nextdigitScore2:    
        mov  dx, 0      
        div  bx         
        add  dl, 0x30   
        push dx         
        inc  cx          
        cmp  ax, 0      
    jnz  nextdigitScore2 
    nextposScore2:
        pop  dx         
        mov  dh, 0x07  
        mov [es:di], dx 
        add  di, 2     
    loop nextposScore2
    
    call ClearBuffer


    mov ah,0
    int 0x16
    mov ah,0
    int 0x16
    call ClearBuffer

    popa
ret

menuWord:
    pusha
    push 0xb800
    pop es
    mov ax,3320h
    ;MenuM
    mov di,506
    mov cx,13
    rep stosw
    mov di,506
    MenuMleft:
        mov [es:di],ax
        add di,160
        cmp di,1626
    jne MenuMleft
    mov di,518
    MenuMmiddle:
        mov [es:di],ax
        add di,160
        cmp di,1638
    jne MenuMmiddle
    mov di,530
    MenuMright:
        mov [es:di],ax
        add di,160
        cmp di,1650
    jne MenuMright

    mov cx,6
    mov di,536
    rep stosw
    mov cx,6
    mov di,1016
    rep stosw
    mov cx,6
    mov di,1496
    rep stosw


    mov di,536
    menuE:
        mov [es:di],ax
        add di,160
        cmp di,1656
    jne menuE

    mov cx,10
    mov di,552
    rep stosw
    mov di,552
    menuNleft:
        mov [es:di],ax
        add di,160
        cmp di,1672
    jne menuNleft
    mov di,570
    menuNright:
        mov [es:di],ax
        add di,160
        cmp di,1690
    jne menuNright


    mov di,576
    menuUleft:
        mov [es:di],ax
        add di,160
        cmp di,1696
    jne menuUleft


    mov di,594
    menuUright:
        mov [es:di],ax
        add di,160
        cmp di,1714
    jne menuUright
    mov cx,10
    mov di,1536
    rep stosw

    popa
ret

Menu:
    jmp pushAllinMenu
    
    menu1:db '1.Start Game';12
    menu2:db '2.Set difficulty';16
    menu3:db '3.Instructions';14
    menu4:db 'Enter choice';12
    pushAllinMenu:
    pusha
    menuLoop:
    call clearScreen
    call menuWord
    mov  ax, 0xb800 
    mov  es, ax
    mov ah,0x07

    mov si,menu1
    mov di,2400
    mov cx,12
    cld 
    nextcharmenu1:
        lodsb                 
        stosw                 
    loop nextcharmenu1
    mov si,menu2
    mov di,2560
    mov cx,16
    cld 
    nextcharmenu2:
        lodsb                 
        stosw                 
    loop nextcharmenu2
    mov si,menu3
    mov di,2720
    mov cx,14
    cld 
    nextcharmenu3:
        lodsb                 
        stosw                 
    loop nextcharmenu3
    mov ah,0x04
    mov si,menu4
    mov di,2880
    mov cx,12
    cld 
    nextcharmenu4:
        lodsb                 
        stosw                 
    loop nextcharmenu4 




    ;Input
    menuInput:
        call ClearBuffer
        xor ax, ax
	    mov ah, 0
        int 0x16

    cmp ah, 0x2
    je option1
    cmp ah,0x3
    je option2
    cmp ah,0x4
    je option3
    cmp ah, 0x01
    je exitFromMenu 
    jmp menuInput

    option1:
        call mainLoop
        call restart
        jmp menuLoop
    option2:
        call clearScreen
        call difficulty
        jmp menuLoop
    option3:
        call clearScreen
        call instructions
        mov ah, 0
        int 0x16
    jmp menuLoop
    exitFromMenu:
    popa
ret

pauseGame:
    pusha
    mov ax,0xb800
    mov es,ax
    mov ah,0xB4
    mov di,0
    mov al,'P'
    mov [es:di+874],ax
    mov al,'A'
    mov [es:di+876],ax
    mov al,'U'
    mov [es:di+878],ax
    mov al,'S'
    mov [es:di+880],ax
    mov al,'E'
    mov [es:di+882],ax
    mov al,'D'
    mov [es:di+884],ax
    
    call ClearBuffer

    mov ah,0
    int 0x16
    mov ah,0
    int 0x16
  

    mov ax,0720h
    mov [es:di+874],ax
    mov [es:di+876],ax
    mov [es:di+878],ax
    mov [es:di+880],ax
    mov [es:di+882],ax
    mov [es:di+884],ax
    popa
ret

check_input:
    push ax
	xor ax, ax
    in al,0x60
    mov ah,al

    cmp ah, 0x48                ; Up key
    je up
    cmp ah, 0x4b                ; Left key
    je left
    cmp ah, 0x4d                ; Right key
    je right
    cmp ah, 0x50                ; Down key
    je down
    cmp ah,0x19                ;pause
    je pauuse
    cmp ah, 0x01                ; Esc key
    jne retFromInput
    mov word[GamePlayStatus],3
    jmp retFromInput
    up:
    mov word[direction],4
    jmp retFromInput
    down:
    mov word[direction],3
    jmp retFromInput
    left:
    mov word[direction],2
    jmp retFromInput
    pauuse:
    call pauseGame
    jmp retFromInput
    right:
    mov word[direction],1

    retFromInput:
    pop ax
ret

ClearBuffer:
    xor ax, ax
    in al, 0x60   
    
    
    test al, 0x80
    jnz ClearBuffer
ret

mainLoop:
    pusha
    startGame:
        call clearScreen
        call Border
        call ScoreAndLives
        call PrintApple
        call PrintSnake
        call difficultySpeedDelay
        call check_input
        push word[direction]
        call moveSnake
        call CheckAppleEat
        call checkBoundaryCollision
        call checkSnakeCollision
        call ScoreAndLives
        cmp word[lives],0
        je endGame
        mov cx,[GamePlayStatus]
        cmp cx,1
    je startGame
    cmp word[GamePlayStatus],3
    je endGame
    call snakeReset
    mov word[GamePlayStatus],1
    cmp word[lives],0
    jne startGame
    endGame:
    call clearScreen
    call TheEnd
    popa
ret



start:
    call  clearScreen
    call loading
    call  clearScreen
    call IntroSnakeGame
    call ClearBuffer
    mov ah,0
    int 0x16
    call Menu
    call clearScreen
    call ThanksForPlaying
mov ax,0x4c00
int 0x21