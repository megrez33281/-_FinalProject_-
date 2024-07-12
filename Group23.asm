INCLUDE Irvine32.inc

main	EQU start@0
ScreenLen = 36
ScreenWid = 56
ButtonLength = 20

DecideDirection PROTO,CircleLoc:COORD,BallDirX:SWORD,BallDirY:SWORD
WriteButton PROTO,ButtonPosXY:COORD,ButtonColor:WORD,ButtonContent:PTR BYTE 
WriteTitle PROTO,TitleColor:WORD,TitlePos:COORD
SetBackGroundColor PROTO,BackGroundColor: WORD
DrawSelectionBox PROTO, BoxColor:WORD,loc:COORD
DrawCircle PROTO, CircleColor:WORD,CircleLoc:COORD
InputNameBackGround PROTO
.data

myHandle DWORD ?
cellsWritten DWORD ?
Absolute DWORD 1    ;�Ҧ��������m
ConsoleRect SMALL_RECT<0,0,ScreenWid-1,ScreenLen-1>   ;�j�p���O��36�M56�A�Gscreen buffer�ܤ֭n��<35,55>
screenSize COORD <ScreenWid,ScreenLen>

;��1
CircleIPos COORD <28,0>
CircleIColor WORD 0dfh


;�W�ٰѼ�(title)
namePos COORD <18,3> 
nameColor WORD 0deh

;�}�l�Ѽ�
StartPos COORD <2,20>
StartColor WORD 06bh
StartChoseColor WORD 0AFh
StartContent BYTE "�}�l",0

;�U���B�ռ��D�Ѽ�
FamilyContent BYTE "�a�x:",0
FamilyGood BYTE "�̪�a�x���Y�M�ӡC",0
FamilyNormal BYTE "��`�ͬ��N����U�h�C",0
FamilyBad BYTE "�ɶq��֪ȯɡC",0
FriendContent BYTE "�B��:",0
FriendGood BYTE "�M�B�ͬ۳B�r�֡C",0
FriendNormal BYTE "�������R�N�O�n�C",0
FriendBad BYTE "�P���ݦp�i���B�C",0
HealthContent BYTE "���d:",0
HealthGood BYTE "����w�d�C",0
HealthNormal BYTE "�i�H�A�h�R�ۤv�@�I�C",0
HealthBad BYTE "�p�ߨ���o�X��ĵ�T�C",0
LoveContent BYTE "���:",0
LoveGood BYTE "�N�Q���쪺�v�J�C",0
LoveNormal BYTE "�|�����ݮɾ��C",0
LoveBad BYTE "�P���ʷP���}���C",0
WealthContent BYTE "�]�I:",0
WealthGood BYTE "�����Q�A�j�����]�C",0
WealthNormal BYTE "�s���O�ثe���̦n��ܡC",0
WealthBad BYTE "����ꥢ�Q�B�˥���]�C",0
WorkContent BYTE "�Ʒ~�G",0
WorkGood BYTE "�Q�H�ۧU�A�ɾE����C",0
WorkNormal BYTE "�����n�ۤv�������C",0
WorkBad BYTE "���W�q�d�|�A�Ʒ~�����C",0
Bad BYTE "��",0
Normal BYTE "��",0
Good BYTE "�N",0
secretword BYTE "�б§ڷQ�n�Ǥ�!!!",0

;�`��B��
squarecolor WORD 0b6h
square11 BYTE "_________________________________________________",0
square12 BYTE "|                                               |",0
square13 BYTE "|                                               |",0
square14 BYTE "|            |            |**** \     / ****|   |",0
square15 BYTE "|            |            |      *****      |   |",0
square16 BYTE "|            |            |**** /     \ ****|   |",0
square17 BYTE "|  __________|_________   |_________________|   |",0
square18 BYTE "|           / \                |       |        |",0
square19 BYTE "|          /   \               |       |        |",0
square110 BYTE "|        /     \               |       |        |",0
square111 BYTE "|        /       \             /       |    |   |",0
square112 BYTE "|       /         \           /        |____|   |",0
square113 BYTE "|_______________________________________________|",0
square21 BYTE "_________________________________________________",0
square22 BYTE "|                                               |",0
square23 BYTE "|                                               |",0
square24 BYTE "|            |*****\       /*****|              |",0
square25 BYTE "|            |      \     /      |              |",0
square26 BYTE "|            |       *****       |              |",0
square27 BYTE "|            |******/     \******|              |",0
square28 BYTE "|            |___________________|              |",0
square29 BYTE "|                 |         |                   |",0
square210 BYTE "|                 |         |      |            |",0
square211 BYTE "|                 /         |      |            |",0
square212 BYTE "|                /          |______|            |",0
square213 BYTE "|_______________________________________________|",0
square31 BYTE "_________________________________________________",0
square32 BYTE "|                                               |",0
square33 BYTE "|                      |                        |",0
square34 BYTE "|                      |                        |",0
square35 BYTE "|         _____________|______________          |",0
square36 BYTE "|                      |                        |",0
square37 BYTE "|                      |                        |",0
square38 BYTE "|            __________|__________              |",0
square39 BYTE "|            _____________________              |",0
square310 BYTE "|            |                   |              |",0
square311 BYTE "|            |                   |              |",0
square312 BYTE "|            |___________________|              |",0
square313 BYTE "|_______________________________________________|",0
square41 BYTE "_________________________________________________",0
square42 BYTE "|                                               |",0
square43 BYTE "|                                               |",0
square44 BYTE "|            |                     |            |",0
square45 BYTE "|            |            _________|_________   |",0
square46 BYTE "|            |                     |            |",0
square47 BYTE "|  __________*___________    ______|______      |",0
square48 BYTE "|           / \              _____________      |",0
square49 BYTE "|          /   \             |           |      |",0
square410 BYTE "|         /     \            |           |      |",0
square411 BYTE "|        /       \           |___________|      |",0
square412 BYTE "|                                               |",0
square413 BYTE "|_______________________________________________|",0
;���}�Ѽ�
ExitPos COORD <34,20>
ExitColor WORD 06bh
ExitChoseColor WORD 0AFh
ExitContent BYTE "���}",0

;�}�l�e�R�Ѽ�
StartIPos COORD <18,20>
StartIColor WORD 0AFh
StartIContent BYTE "�e�R",0

;�]�w�I����
BackGroundPink WORD 0d6h     ;�I���C��(���)
BackGroundAllPink WORD 0ddh  ;�����
BackGroundBlack WORD  white + ( black*16 ) ;�I���C��(��)
BackGroundGoldenYellow WORD 0ech
BackGroundBlue WORD 0b6h


Choose DWORD 0  ;���䪺��m�P�_(0��start,1��exit)

;Ū���W��
truename BYTE "professor",0
nameBuffer BYTE 40 DUP(0)
nameCount DWORD ?
InputNameMessage BYTE "�п�J�W�١G",0

;���ô��
SetOfCursor CONSOLE_CURSOR_INFO <17,0>
SetOfCursorI CONSOLE_CURSOR_INFO <17,1>

;�y����T
LocOfBallI COORD <2,16>,<47,20>,<9,30>,<2,25>,<36,22>,<15,12>
BallCount DWORD 6  ;�y���ƶq
BallDirectinoX SWORD -1,-1,1,-1,2,1
BallDirectionY SWORD 1,-1,1,-1,1,-1
TheSpace BYTE "  ",0

;�B�հѼ�
famCtr byte ?
friCtr byte ?
healCtr byte ?
loveCtr byte ?
wealthCtr byte ?
workCtr byte ?
allCtr Sbyte ?

.code
main PROC
    
    animation:
    call StartScreen
    
    ;��J�W�٪�����
    InputName:
    
    ;�]�w�I��
    Invoke SetBackGroundColor,BackGroundGoldenYellow
    INVOKE WriteButton,StartIPos,StartIColor,ADDR StartIContent
    INVOKE DrawSelectionBox,BackGroundGoldenYellow,StartIPos

    mov ecx,30
    
    BallRun:
        push ecx
        mov esi,0
        mov ecx,BallCount
    setBall:
        INVOKE DrawCircle,BackGroundGoldenYellow,COORD PTR LocOfBallI[esi]
        INVOKE WriteButton,StartIPos,StartIColor,ADDR StartIContent
        add esi,4   
        loop setBall
         mov eax,100
        call delay
        INVOKE InputNameBackGround
        jmp endStair
    tempStair:
        jmp BallRun
    endStair:
        mov ecx,BallCount  
        mov esi,0
        mov edi,0
    setLoc:
        mov bx,SWORD PTR BallDirectinoX[edi]
        mov dx,SWORD PTR BallDirectionY[edi]
        Invoke DecideDirection, COORD PTR LocOfBallI[esi],SWORD PTR BallDirectinoX[edi],SWORD PTR BallDirectionY[edi]
        mov SWORD PTR BallDirectinoX[edi],bx
        mov SWORD PTR BallDirectionY[edi],dx
        add (COORD PTR LocOfBallI[esi]).x,bx
        add (COORD PTR LocOfBallI[esi]).y,dx
        add esi,4
        add edi,2
        loop setLoc
        pop ecx
    loop tempStair

    mov ecx,BallCount
    mov esi,0
    setBallI:
        INVOKE DrawCircle,BackGroundGoldenYellow,COORD PTR LocOfBallI[esi]
        INVOKE WriteButton,StartIPos,StartIColor,ADDR StartIContent
        add esi,4   
        loop setBallI

    mov eax,0e5h    ;����
    call SetTextColor
    mov dl,10
    mov dh,14
    call Gotoxy
    mov edx,OFFSET InputNameMessage
    call WriteString


    ;�]�w���
    INVOKE SetConsoleCursorInfo,myHandle,ADDR SetOfCursorI

    mov edx,OFFSET nameBuffer
    mov ecx,SIZEOF nameBuffer
    call ReadString
    mov nameCount,eax
    INVOKE SetBackGroundColor,BackGroundBlack

    ;�]�w���
    INVOKE SetConsoleCursorInfo,myHandle,ADDR SetOfCursor

    TheResult:  ;���G
    ;�W�٦s�bnameBuffer��
    call OutputScreen
    mov ecx,19
    Lx:
        call CRLF
        LOOP Lx
    call ReadChar
    exit

        
main ENDP

WriteButton PROC USES eax ecx edx,ButtonPosXY:COORD,ButtonColor:WORD,ButtonContent:PTR BYTE 
    
    .data
    ButtonSpace BYTE ButtonLength DUP(' ')
    Dividend BYTE 2
    ColorArray WORD ButtonLength DUP(0)
    .code
    mov ecx,ButtonLength
    mov edx,0
    setColorArray:
        mov ax,ButtonColor
        mov ColorArray[edx],ax
        add edx,2
    loop setColorArray

    ;�Ĥ@��
    INVOKE WriteConsoleOutputAttribute,myHandle,ADDR ColorArray,ButtonLength,ButtonPosXY,ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,myHandle,ADDR ButtonSpace,ButtonLength,ButtonPosXY,ADDR cellsWritten
    ;�ĤG��
    inc ButtonPosXY.y
    INVOKE WriteConsoleOutputAttribute,myHandle,ADDR ColorArray,ButtonLength,ButtonPosXY,ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,myHandle,ADDR ButtonSpace,ButtonLength,ButtonPosXY,ADDR cellsWritten
    
    mov ax,ButtonLength
    sub ax,SIZEOF ButtonContent
    CWD
    div Dividend

    push ButtonPosXY.x  ;�]�n����x����m�A�G�N���x����m�Ȧs
    add ButtonPosXY.x,ax
    mov eax,0
    mov ax,ButtonPosXY.x
    mov dl,BYTE PTR ButtonPosXY.x
    mov dh,BYTE PTR ButtonPosXY.y
    call Gotoxy
    INVOKE SetConsoleTextAttribute,myHandle,ButtonColor
    mov edx,ButtonContent
    call WriteString
    mov dl,0
    mov dh,0
    call Gotoxy

  
    ;�ĤT��
    pop ButtonPosXY.x   ;���^���x����m
    inc ButtonPosXY.y
    INVOKE WriteConsoleOutputAttribute,myHandle,ADDR ColorArray,ButtonLength,ButtonPosXY,ADDR cellsWritten
    INVOKE WriteConsoleOutputCharacter,myHandle,ADDR ButtonSpace,ButtonLength,ButtonPosXY,ADDR cellsWritten

    ret
WriteButton ENDP

SetBackGroundColor PROC USES ecx edx,BackGroundColor:WORD
    .data
    WordI BYTE ScreenWid DUP(" "),0
    .code
    mov ecx,ScreenLen
    mov dl,0
    mov dh,0
    call Gotoxy
    push edx
    setBackGround:
        movzx eax, BackGroundColor
        call SetTextColor
        mov edx, OFFSET WordI
        call WriteString
        pop edx
        inc dh
        call Gotoxy
        push edx
    loop setBackGround
    mov dl,0
    mov dh,0
    call Gotoxy ;�^����I
    ret
SetBackGroundColor ENDP

DrawSelectionBox PROC USES eax edx edi, BoxColor:WORD,loc:COORD  ;2,20
.data
    BoxLeft BYTE "�z�w",0
    BoxRight BYTE "�w�{",0
    BoxButtomLeft BYTE "�|�w",0
    BoxButtomRight BYTE "�w�}",0
    BoxStraight BYTE "�x",0

.code
    movzx eax,BoxColor
    call SetTextColor
    mov edi,0

    ;���W��
    mov dl,BYTE PTR loc.x[edi]
    sub dl,2    ;����2
    mov dh,BYTE PTR loc.y[edi]  
    sub dh,1    ;�W��1
    call Gotoxy
    mov edx,OFFSET BoxLeft
    call WriteString
    mov dl,BYTE PTR loc.x[edi]
    sub dl,2    ;����2
    mov dh,BYTE PTR loc.y[edi]  
    call Gotoxy
    mov edx,OFFSET BoxStraight
    call WriteString

    ;�k�W��
    mov dl,BYTE PTR loc.x[edi]
    add dl,ButtonLength -1
    mov dh,BYTE PTR loc.y[edi]  
    sub dh,1  
    call Gotoxy
    mov edx,OFFSET BoxRight
    call WriteString
    mov dl,BYTE PTR loc.x[edi]
    add dl,ButtonLength 
    mov dh,BYTE PTR loc.y[edi]  
    call Gotoxy
    mov edx,OFFSET BoxStraight
    call WriteString

    ;���U��
    mov dl,BYTE PTR loc.x[edi]
    sub dl,2    
    mov dh,BYTE PTR loc.y[edi]  
    add dh,3   
    call Gotoxy
    mov edx,OFFSET BoxButtomLeft
    call WriteString
    mov dl,BYTE PTR loc.x[edi]
    sub dl,2  
    mov dh,BYTE PTR loc.y[edi]  
    add dh,2
    call Gotoxy
    mov edx,OFFSET BoxStraight
    call WriteString

    ;�k�U��
    mov dl,BYTE PTR loc.x[edi]
    add dl,ButtonLength -1
    mov dh,BYTE PTR loc.y[edi]  
    add dh,3 
    call Gotoxy
    mov edx,OFFSET BoxButtomRight
    call WriteString
    mov dl,BYTE PTR loc.x[edi]
    add dl,ButtonLength 
    mov dh,BYTE PTR loc.y[edi]  
    add dh,2 
    call Gotoxy
    mov edx,OFFSET BoxStraight
    call WriteString

    ret
DrawSelectionBox ENDP

WriteTitle PROC USES eax edx edi,TitleColor:WORD,TitlePos:COORD

.data
    ComponentI BYTE "�x",0
    ComponentII BYTE "�w�w�w",0
    ComponentIII BYTE "�z�w�w�w�} �|�w�w�w�{",0
    ComponentIV BYTE  "�x         �x",0
    ComponentV BYTE "�|�w�w�w�w�w�w�w�w�w�}",0
    ComponentVI BYTE "�w�w�w�w",0
.code
    ;��l�]�w
    mov edi,0
    movzx eax,TitleColor
    call SetTextColor

    ;�e�X���D
    mov dl,BYTE PTR TitlePos.x[edi]
    mov dh,BYTE PTR TitlePos.y[edi]  
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString


    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dl
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentII
    call WriteString

    pop edx
    dec dl
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dh
    sub dl,5
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentIII
    call WriteString

    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentIV
    call WriteString
    
    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentV
    call WriteString


;�ĤG�Ӧr
    pop edx
    add dl,25   ;�P�Ĥ@�Ӧr�����j
    add dh,2
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dl
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentVI
    call WriteString

    pop edx
    dec dl
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString

    pop edx
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET ComponentI
    call WriteString
    ret
WriteTitle ENDP

StartScreen PROC 

 ;�]�wwindow console �P screen buffer �j�p
    INVOKE SetConsoleTitle, ADDR StartIContent
    INVOKE GetStdHandle,STD_OUTPUT_HANDLE
    mov myHandle,eax
    INVOKE SetConsoleWindowInfo,myHandle,Absolute,ADDR ConsoleRect  ;�]�wconsole���j�p�P��bscreen buffer������m
    INVOKE setConsoleScreenBufferSize,myHandle,screenSize   ;�]�wscreen buffer���j�p

    ;�]�w���
    INVOKE SetConsoleCursorInfo,myHandle,ADDR SetOfCursor

    ;�]�w�I���C��
    INVOKE SetBackGroundColor, BackGroundPink

    ;�e���
    mov ecx,10
    call Randomize
    mov ecx,10  ;�ƶq
    DrawAcircle:
        push ecx
        mov eax,ScreenWid
        call RandomRange
        mov CircleIPos.x,ax
        mov eax,ScreenLen
        call RandomRange
        mov CircleIPos.y,ax
        ;mov eax,16
        ;call RandomRange
        ;mov CircleIColor,ax
        ;add CircleIColor,0d0h
        INVOKE DrawCircle,CircleIColor,CircleIPos
       
        pop ecx
    loop DrawAcircle

    ;�e�X�W��
    INVOKE WriteTitle,nameColor,namePos

    ;�e�X�}�l��
    INVOKE DrawSelectionBox,BackGroundPink,StartPos
    INVOKE WriteButton,StartPos,StartChoseColor,ADDR StartContent

    ;���X���}��
    INVOKE WriteButton,ExitPos,ExitColor,ADDR ExitContent

    ChoseStart:
    inc CircleIPos.y
    ;��V��i����
    call ReadChar

    .IF ax == 4B00h ;����
        cmp Choose,1   ;�ثe��ܬ�Exit
        je StartIsChose
        jmp EndOfLeft

        StartIsChose:
            mov Choose,0
            INVOKE WriteButton,StartPos,StartchoseColor,ADDR StartContent
            INVOKE DrawSelectionBox,BackGroundPink,StartPos
            INVOKE DrawSelectionBox,BackGroundAllPink,ExitPos
            INVOKE WriteButton,ExitPos,ExitColor,ADDR ExitContent
        EndOfLeft:
           
    .ENDIF

    .IF ax == 4D00h     ;�k��
        cmp Choose,0    ;�ثe���Start
        je ExitIsChose
        jmp EndOfRight

        ExitIsChose:
            mov Choose,1
            INVOKE WriteButton,StartPos,StartColor,ADDR StartContent
            INVOKE DrawSelectionBox,BackGroundPink,ExitPos
            INVOKE DrawSelectionBox,BackGroundAllPink,StartPos
            INVOKE WriteButton,ExitPos,ExitchoseColor,ADDR ExitContent
        EndOfRight:
    .ENDIF

    .IF ax == 1C0Dh     ;Enter��
        call Clrscr
        INVOKE SetBackGroundColor, BackGroundBlack
        call Clrscr
        cmp Choose,0    ;��ܬ�Start
        je TheEndOfStartScreen
        jmp TheEnd

    .ENDIF

    StairI:
    jmp ChoseStart
    
    jmp StairI
    TheEnd:
    mov eax, white + ( black*16 )    ; �զr�©�
    call SetTextColor
    exit

    jmp StairI
    TheEndOfStartScreen:
    ret

StartScreen ENDP

DrawCircle PROC USES eax edx edi, CircleColor:WORD,CircleLoc:COORD
    .data
    TheCircle BYTE "��",0
    .code
    movzx eax,CircleColor
    call SetTextColor
    mov edi,0
    
    mov dl, BYTE PTR CircleLoc.x[edi]
    mov dh, BYTE PTR CircleLoc.y[edi]
    call Gotoxy
    mov edx,OFFSET TheCircle
    call WriteString

    ret
DrawCircle ENDP

DecideDirection PROC,CircleLoc:COORD,BallDirX:SWORD,BallDirY:SWORD
    .data
    MinusOne SBYTE -1
    .code
    movsx ebx,BallDirX
    movsx edx,BallDirY
    cmp CircleLoc.x,0
    je ChangeX
    cmp CircleLoc.x,(ScreenWid-2)
    je ChangeX
    jmp judgeY
    ChangeX:
        mov ax,BallDirX
        IMUL MinusOne
        mov bx,ax

    judgeY:
    cmp CircleLoc.y,0
    je ChangeY
    cmp CircleLoc.y,(ScreenLen-1)
    je ChangeY
    jmp endOfjudge
    ChangeY:
        mov ax,BallDirY
        IMUL MinusOne
        mov dx,ax

    endOfjudge:

    ret
DecideDirection ENDP

InputNameBackGround PROC
    Invoke SetBackGroundColor,BackGroundGoldenYellow
    INVOKE WriteButton,StartIPos,StartIColor,ADDR StartIContent
    INVOKE DrawSelectionBox,BackGroundGoldenYellow,StartIPos
    mov eax,0e5h    ;����
    call SetTextColor
    mov dl,10
    mov dh,14
    call Gotoxy
    mov edx,OFFSET InputNameMessage
    call WriteString
    ret
InputNameBackGround ENDP

family PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV famCtr, al
    POPAD
    RET
family ENDP

friendship PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV friCtr, al
    POPAD
    RET
    RET
friendship ENDP

health PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV healCtr, al
    POPAD
    RET
    RET
health ENDP

love PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV loveCtr, al
    POPAD
    RET
love ENDP

work PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV workCtr, al
    POPAD
    RET
    RET
work ENDP

wealth PROC
    PUSHAD
    CALL GetMseconds
    MOV edx, 0
    MOV ebx, 3
    DIV ebx
    MOV eax, edx
    DEC eax
    MOV wealthCtr, al
    POPAD
    RET
    RET
wealth ENDP

OutputScreen PROC
    PUSHAD
    INVOKE SetConsoleTitle, ADDR StartIContent
    INVOKE GetStdHandle,STD_OUTPUT_HANDLE
    mov myHandle,eax
    INVOKE SetConsoleWindowInfo,myHandle,Absolute,ADDR ConsoleRect  ;�]�wconsole���j�p�P��bscreen buffer������m
    INVOKE setConsoleScreenBufferSize,myHandle,screenSize   ;�]�wscreen buffer���j�p

    ;�]�w���
    INVOKE SetConsoleCursorInfo,myHandle,ADDR SetOfCursor

    ;�]�w�I���C��
    INVOKE SetBackGroundColor, BackGroundBlue

    ;��ܦU���B��
L1:
    mov eax,0b5h    
    call SetTextColor
    mov dl,10
    mov dh,20
    call Gotoxy
    mov edx,OFFSET FamilyContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP1
    call family
    movzx ax,famCtr
    mov allCtr,al
    cmp ax,00ffh
    je LN1
    cmp ax,0
    je LZ1
    ja LP1
LN1:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,20
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,20
    call Gotoxy
    mov edx,OFFSET FamilyBad
    call WriteString
    jmp L2
LZ1:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,20
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,20
    call Gotoxy
    mov edx,OFFSET FamilyNormal
    call WriteString
    jmp L2
LP1:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,20
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,20
    call Gotoxy
    mov edx,OFFSET FamilyGood
    call WriteString
    jmp L2
L2:
    mov eax,0b5h
    call SetTextColor
    mov dl,10
    mov dh,22
    call Gotoxy
    mov edx,OFFSET FriendContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP2
    call friendship
    movzx ax,friCtr
    add allCtr,al
    cmp ax,00ffh
    je LN2
    cmp ax,0
    je LZ2
    ja LP2
LN2:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,22
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,22
    call Gotoxy
    mov edx,OFFSET FriendBad
    call WriteString
    jmp L3
LZ2:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,22
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,22
    call Gotoxy
    mov edx,OFFSET FriendNormal
    call WriteString
    jmp L3
LP2:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,22
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,22
    call Gotoxy
    mov edx,OFFSET FriendGood
    call WriteString
    jmp L3
L3:
    mov eax,0b5h
    call SetTextColor
    mov dl,10
    mov dh,24
    call Gotoxy
    mov edx,OFFSET HealthContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP3
    call health
    movzx ax,healCtr
    add allCtr,al
    cmp ax,00ffh
    je LN3
    cmp ax,0
    je LZ3
    ja LP3
LN3:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,24
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,24
    call Gotoxy
    mov edx,OFFSET HealthBad
    call WriteString
    jmp L4
LZ3:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,24
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,24
    call Gotoxy
    mov edx,OFFSET HealthNormal
    call WriteString
    jmp L4
LP3:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,24
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,24
    call Gotoxy
    mov edx,OFFSET HealthGood
    call WriteString
    jmp L4
L4:
    mov eax,0b5h
    call SetTextColor
    mov dl,10
    mov dh,26
    call Gotoxy
    mov edx,OFFSET LoveContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP4
    call love
    movzx ax,loveCtr
    add allCtr,al
    cmp ax,00ffh
    je LN4
    cmp ax,0
    je LZ4
    ja LP4
LN4:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,26
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,26
    call Gotoxy
    mov edx,OFFSET LoveBad
    call WriteString
    jmp L5
LZ4:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,26
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,26
    call Gotoxy
    mov edx,OFFSET LoveNormal
    call WriteString
    jmp L5
LP4:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,26
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,26
    call Gotoxy
    mov edx,OFFSET LoveGood
    call WriteString
    jmp L5
L5:
    mov eax,0b5h
    call SetTextColor
    mov dl,10
    mov dh,28
    call Gotoxy
    mov edx,OFFSET WealthContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP5
    call wealth
    movzx ax,wealthCtr
    add allCtr,al
    cmp ax,00ffh
    je LN5
    cmp ax,0
    je LZ5
    ja LP5
LN5:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,28
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,28
    call Gotoxy
    mov edx,OFFSET WealthBad
    call WriteString
    jmp L6
LZ5:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,28
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,28
    call Gotoxy
    mov edx,OFFSET WealthNormal
    call WriteString
    jmp L6
LP5:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,28
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,28
    call Gotoxy
    mov edx,OFFSET WealthGood
    call WriteString
    jmp L6
L6:
    mov eax,0b5h
    call SetTextColor
    mov dl,10
    mov dh,30
    call Gotoxy
    mov edx,OFFSET WorkContent
    call WriteString
    mov al,nameBuffer
    cmp al,truename
    je LP6
    call work
    movzx ax,workCtr
    add allCtr,al
    cmp ax,00ffh
    je LN6
    cmp ax,0
    je LZ6
    ja LP6
LN6:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,30
    call Gotoxy
    mov edx,OFFSET Bad
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,30
    call Gotoxy
    mov edx,OFFSET WorkBad
    call WriteString
    jmp Last
LZ6:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,30
    call Gotoxy
    mov edx,OFFSET Normal
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,30
    call Gotoxy
    mov edx,OFFSET WorkNormal
    call WriteString
    jmp Last
LP6:
    mov eax,0b5h
    call SetTextColor
    mov dl,16
    mov dh,30
    call Gotoxy
    mov edx,OFFSET Good
    call WriteString

    mov eax,0b5h
    call SetTextColor
    mov dl,20
    mov dh,30
    call Gotoxy
    mov edx,OFFSET WorkGood
    call WriteString

    mov al,nameBuffer
    cmp al,truename
    je LSecret
    jne Last
LSecret:
    mov eax,0b6h
    call SetTextColor
    mov dl,20
    mov dh,32
    call Gotoxy
    mov edx,OFFSET secretword
    call WriteString
Last:
    mov al,nameBuffer
    cmp al,truename
    je L4all
    mov al,allCtr
    cmp al,0
    jl L2all
    jmp L4all
L2all:
    cmp al,-3
    jl L1all
    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,3
    call Gotoxy
    mov edx,OFFSET square21
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,4
    call Gotoxy
    mov edx,OFFSET square22
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,5
    call Gotoxy
    mov edx,OFFSET square23
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,6
    call Gotoxy
    mov edx,OFFSET square24
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,7
    call Gotoxy
    mov edx,OFFSET square25
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,8
    call Gotoxy
    mov edx,OFFSET square26

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,9
    call Gotoxy
    mov edx,OFFSET square27
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,10
    call Gotoxy
    mov edx,OFFSET square28
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,11
    call Gotoxy
    mov edx,OFFSET square29
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,12
    call Gotoxy
    mov edx,OFFSET square210
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,13
    call Gotoxy
    mov edx,OFFSET square211
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,14
    call Gotoxy
    mov edx,OFFSET square212
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,15
    call Gotoxy
    mov edx,OFFSET square213
    call WriteString
    jmp Final
L1all:
    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,3
    call Gotoxy
    mov edx,OFFSET square11
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,4
    call Gotoxy
    mov edx,OFFSET square12
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,5
    call Gotoxy
    mov edx,OFFSET square13
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,6
    call Gotoxy
    mov edx,OFFSET square14
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,7
    call Gotoxy
    mov edx,OFFSET square15
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,8
    call Gotoxy
    mov edx,OFFSET square16

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,9
    call Gotoxy
    mov edx,OFFSET square17
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,10
    call Gotoxy
    mov edx,OFFSET square18
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,11
    call Gotoxy
    mov edx,OFFSET square19
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,12
    call Gotoxy
    mov edx,OFFSET square110
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,13
    call Gotoxy
    mov edx,OFFSET square111
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,14
    call Gotoxy
    mov edx,OFFSET square112
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,15
    call Gotoxy
    mov edx,OFFSET square113
    call WriteString
    jmp Final
L4all:
    cmp al,4
    jl L3all
    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,3
    call Gotoxy
    mov edx,OFFSET square41
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,4
    call Gotoxy
    mov edx,OFFSET square42
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,5
    call Gotoxy
    mov edx,OFFSET square43
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,6
    call Gotoxy
    mov edx,OFFSET square44
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,7
    call Gotoxy
    mov edx,OFFSET square45
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,8
    call Gotoxy
    mov edx,OFFSET square46

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,9
    call Gotoxy
    mov edx,OFFSET square47
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,10
    call Gotoxy
    mov edx,OFFSET square48
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,11
    call Gotoxy
    mov edx,OFFSET square49
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,12
    call Gotoxy
    mov edx,OFFSET square410
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,13
    call Gotoxy
    mov edx,OFFSET square411
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,14
    call Gotoxy
    mov edx,OFFSET square412
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,15
    call Gotoxy
    mov edx,OFFSET square413
    call WriteString
    jmp Final
L3all:
    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,3
    call Gotoxy
    mov edx,OFFSET square31
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,4
    call Gotoxy
    mov edx,OFFSET square32
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,5
    call Gotoxy
    mov edx,OFFSET square33
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,6
    call Gotoxy
    mov edx,OFFSET square34
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,7
    call Gotoxy
    mov edx,OFFSET square35
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,8
    call Gotoxy
    mov edx,OFFSET square36

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,9
    call Gotoxy
    mov edx,OFFSET square37
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,10
    call Gotoxy
    mov edx,OFFSET square38
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,11
    call Gotoxy
    mov edx,OFFSET square39
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,12
    call Gotoxy
    mov edx,OFFSET square310
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,13
    call Gotoxy
    mov edx,OFFSET square311
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,14
    call Gotoxy
    mov edx,OFFSET square312
    call WriteString

    mov ax,squarecolor
    call SetTextColor
    mov dl,3
    mov dh,15
    call Gotoxy
    mov edx,OFFSET square313
    call WriteString

Final:
    POPAD
    ret
OutputScreen ENDP
END main