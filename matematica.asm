section .text
global soma, subtracao, multiplicacao, divisao, resto_divisao
global potencia, fatorial, fibonacci, maximo, minimo
global par, impar, absoluto, soma_vetor, media_vetor
global and_bitwise, or_bitwise, xor_bitwise, not_bitwise
global shift_esquerda, shift_direita
global para_positivo, para_negativo
global par_ou_impar
soma:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; Primeiro parâmetro (a)
    mov ecx, [ebp+12]   ; Segundo parâmetro (b)
    add eax, ecx        ; a + b
    
    pop ebp
    ret

subtracao:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    sub eax, ecx        ; a - b
    
    pop ebp
    ret

multiplicacao:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    imul eax, ecx       ; a * b
    
    pop ebp
    ret


divisao:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    cdq                 ; Estende sinal para EDX:EAX
    mov ecx, [ebp+12]   ; b
    idiv ecx            ; EAX = EDX:EAX / ECX
    
    pop ebp
    ret

; int resto_divisao(int a, int b)
resto_divisao:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    cdq                 ; Estende sinal para EDX:EAX
    mov ecx, [ebp+12]   ; b
    idiv ecx            ; EDX = resto da divisão
    mov eax, edx        ; Retorna o resto
    
    pop ebp
    ret

;===========================================
; FUNÇÕES AVANÇADAS
;===========================================

; int potencia(int base, int expoente)
potencia:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    
    mov eax, 1          ; resultado = 1
    mov ecx, [ebp+12]   ; expoente
    mov ebx, [ebp+8]    ; base
    
    ; Se expoente for 0, retorna 1
    test ecx, ecx
    jz .fim
    
    ; Se expoente for negativo, retorna 0 (para simplificar)
    js .negativo
    
.loop:
    imul eax, ebx       ; resultado *= base
    loop .loop          ; dec ecx, jnz .loop
    jmp .fim

.negativo:
    mov eax, 0          ; Para expoente negativo, retorna 0
    
.fim:
    pop ecx
    pop ebx
    pop ebp
    ret

; int fatorial(int n)
fatorial:
    push ebp
    mov ebp, esp
    push ebx
    
    mov eax, 1          ; resultado = 1
    mov ecx, [ebp+8]    ; n
    
    ; Se n <= 0, retorna 1
    cmp ecx, 0
    jle .fim
    
.loop:
    imul eax, ecx       ; resultado *= n
    loop .loop          ; dec ecx, jnz .loop
    
.fim:
    pop ebx
    pop ebp
    ret

; int fibonacci(int n)
fibonacci:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    
    mov ecx, [ebp+8]    ; n
    
    ; Casos base
    cmp ecx, 0
    je .zero
    cmp ecx, 1
    je .um
    
    ; Fibonacci iterativo
    mov eax, 0          ; fib(n-2)
    mov ebx, 1          ; fib(n-1)
    dec ecx             ; n-1
    
.loop:
    mov edx, ebx        ; temp = fib(n-1)
    add ebx, eax        ; fib(n-1) = fib(n-1) + fib(n-2)
    mov eax, edx        ; fib(n-2) = temp
    
    loop .loop
    
    mov eax, ebx        ; Retorna fib(n)
    jmp .fim

.zero:
    mov eax, 0
    jmp .fim
    
.um:
    mov eax, 1
    
.fim:
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

; int maximo(int a, int b)
maximo:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    
    cmp eax, ecx
    jge .fim            ; Se a >= b, retorna a
    mov eax, ecx        ; Senão, retorna b
    
.fim:
    pop ebp
    ret

; int minimo(int a, int b)
minimo:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    
    cmp eax, ecx
    jle .fim            ; Se a <= b, retorna a
    mov eax, ecx        ; Senão, retorna b
    
.fim:
    pop ebp
    ret

; int par(int n)
par:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; n
    and eax, 1          ; n & 1
    xor eax, 1          ; Inverte: 0 se ímpar, 1 se par
    
    pop ebp
    ret

; int impar(int n)
impar:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; n
    and eax, 1          ; n & 1 (retorna 1 se ímpar, 0 se par)
    
    pop ebp
    ret

; int absoluto(int n)
absoluto:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; n
    
    ; Se n >= 0, retorna n
    test eax, eax
    jns .fim
    
    ; Senão, retorna -n
    neg eax
    
.fim:
    pop ebp
    ret

;===========================================
; FUNÇÕES COM VETORES
;===========================================

; int soma_vetor(int* vetor, int tamanho)
soma_vetor:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    
    mov ebx, [ebp+8]    ; ponteiro para o vetor
    mov ecx, [ebp+12]   ; tamanho
    mov eax, 0          ; soma = 0
    
    test ecx, ecx
    jz .fim             ; Se tamanho = 0, retorna 0
    
.soma_loop:
    add eax, [ebx]      ; soma += vetor[i]
    add ebx, 4          ; próximo elemento (int = 4 bytes)
    loop .soma_loop
    
.fim:
    pop ecx
    pop ebx
    pop ebp
    ret

; int media_vetor(int* vetor, int tamanho)
media_vetor:
    push ebp
    mov ebp, esp
    
    ; Primeiro calcula a soma
    push dword [ebp+12] ; tamanho
    push dword [ebp+8]  ; vetor
    call soma_vetor
    add esp, 8          ; Limpa parâmetros da pilha
    
    ; Agora divide pelo tamanho
    mov ecx, [ebp+12]   ; tamanho
    test ecx, ecx
    jz .div_zero        ; Evita divisão por zero
    
    cdq                 ; Estende sinal
    idiv ecx            ; EAX = soma / tamanho
    jmp .fim
    
.div_zero:
    mov eax, 0
    
.fim:
    pop ebp
    ret

;===========================================
; OPERAÇÕES BITWISE
;===========================================

; int and_bitwise(int a, int b)
and_bitwise:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    and eax, ecx        ; a & b
    
    pop ebp
    ret

; int or_bitwise(int a, int b)
or_bitwise:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    or eax, ecx         ; a | b
    
    pop ebp
    ret

; int xor_bitwise(int a, int b)
xor_bitwise:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; b
    xor eax, ecx        ; a ^ b
    
    pop ebp
    ret

; int not_bitwise(int a)
not_bitwise:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    not eax             ; ~a
    
    pop ebp
    ret

; int shift_esquerda(int a, int bits)
shift_esquerda:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; bits
    shl eax, cl         ; a << bits
    
    pop ebp
    ret

; int shift_direita(int a, int bits)
shift_direita:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; a
    mov ecx, [ebp+12]   ; bits
    sar eax, cl         ; a >> bits (arithmetic shift)
    
    pop ebp
    ret

;===========================================
; CONVERSÕES
;===========================================

; int para_positivo(int n)
para_positivo:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; n
    
    ; Se já for positivo, retorna
    test eax, eax
    jns .fim
    
    ; Senão, converte para positivo
    neg eax
    
.fim:
    pop ebp
    ret

; int para_negativo(int n)
para_negativo:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; n
    
    ; Se já for negativo, retorna
    test eax, eax
    js .fim
    
    ; Senão, converte para negativo
    neg eax
    
.fim:
    pop ebp
    ret
; int par_ou_impar(int n) // Retorna 1 se par, 0 se ímpar
par_ou_impar:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]    ; n
    and eax, 1          ; n & 1
    xor eax, 1          ; Inverte: 1 se par, 0 se ímpar
    .fim:
    pop ebp
    ret

