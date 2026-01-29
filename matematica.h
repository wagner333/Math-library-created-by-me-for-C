#ifndef MATEMATICA_H
#define MATEMATICA_H
#ifdef __cplusplus
extern "C" {
#endif
// Funções básicas
int soma(int a, int b);
int subtracao(int a, int b);
int multiplicacao(int a, int b);
int divisao(int a, int b);
int resto_divisao(int a, int b);
// Funções avançadas
int potencia(int base, int expoente);
int fatorial(int n);
int fibonacci(int n);
int maximo(int a, int b);
int minimo(int a, int b);
int par(int n);
int impar(int n);
int absoluto(int n);
// Funções com ponto flutuante (simuladas com inteiros para simplificar)
int soma_vetor(int* vetor, int tamanho);
int media_vetor(int* vetor, int tamanho);
// Operações bitwise
int and_bitwise(int a, int b);
int or_bitwise(int a, int b);
int xor_bitwise(int a, int b);
int not_bitwise(int a);
int shift_esquerda(int a, int bits);
int shift_direita(int a, int bits);
int para_positivo(int n);
int para_negativo(int n);
int par_ou_impar(int n); // Retorna 1 se par, 0 se ímpar
#ifdef __cplusplus
}
#endif

#endif // MATEMATICA_H