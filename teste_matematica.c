#include <stdio.h>
#include "matematica.h"
int main() {
    printf("Soma: %d + %d = %d\n", 10, 5, soma(10, 5));
    printf("Subtracao: %d - %d = %d\n", 10, 5, subtracao(10, 5));
    printf("Multiplicacao: %d * %d = %d\n", 10, 5, multiplicacao(10, 5));
    printf("Divisao: %d / %d = %d\n", 10, 5, divisao(10, 5));
    printf("Resto: %d %% %d = %d\n", 10, 3, resto_divisao(10, 3));
    printf("\nPotencia: %d^%d = %d\n", 2, 5, potencia(2, 5));
    printf("Fatorial: %d! = %d\n", 5, fatorial(5));
    printf("Fibonacci(%d) = %d\n", 10, fibonacci(10));
    printf("Maximo(%d, %d) = %d\n", 10, 20, maximo(10, 20));
    printf("Minimo(%d, %d) = %d\n", 10, 20, minimo(10, 20));
    printf("\nPar(%d) = %d\n", 7, par(7));
    printf("Impar(%d) = %d\n", 7, impar(7));
    printf("Absoluto(%d) = %d\n", -15, absoluto(-15));
    int vetor[] = {1, 2, 3, 4, 5};
    int tamanho = sizeof(vetor) / sizeof(vetor[0]);
    printf("\nSoma do vetor = %d\n", soma_vetor(vetor, tamanho));
    printf("Media do vetor = %d\n", media_vetor(vetor, tamanho));
    printf("\nBitwise AND: %d & %d = %d\n", 5, 3, and_bitwise(5, 3));
    printf("Bitwise OR: %d | %d = %d\n", 5, 3, or_bitwise(5, 3));
    printf("Bitwise XOR: %d ^ %d = %d\n", 5, 3, xor_bitwise(5, 3));
    printf("Bitwise NOT: ~%d = %d\n", 5, not_bitwise(5));
    printf("Shift esquerda: %d << %d = %d\n", 5, 2, shift_esquerda(5, 2));
    printf("Shift direita: %d >> %d = %d\n", 20, 2, shift_direita(20, 2));

    printf("\nPara positivo: %d -> %d\n", -10, para_positivo(-10));
    printf("Para negativo: %d -> %d\n", 10, para_negativo(10));

    printf("\nPar ou Impar(%d) = %d\n", 8, par_ou_impar(7)); // inpar deve retornar 0 se n for  retorna 1 
    
    return 0;
}