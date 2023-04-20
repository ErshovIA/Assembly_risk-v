#include <stdio.h>
#define N 5
#define M 3


void process(int* minimal_sum_str_num, int matrix[M][N])
{
    int minimal_sum = 2147483647; // минимальная сумма найденная на предыдущей итерации
    int current_sum = 0; // значение суммы в текущей строке
    for (int i = 0; i < M; i++) {
        current_sum = 0;
        for (int j = 0; j < N; j++) {
            current_sum += matrix[i][j];
        }

        if (current_sum < minimal_sum) {
            minimal_sum = current_sum;
            *minimal_sum_str_num = i;
        }
    }

}

int main(int argc, char** argv)
{


    int matrix[M][N] = { { 1,1,1,1,1 }, {2, 2, 2, 2, 2}, {1, 1, 1, 1, 0} };
    int minimal_sum_str_num; // номер строки с минимальной суммой


    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            printf("%d", matrix[i][j]);
        }
        printf("\n");
    }

    process(&minimal_sum_str_num, matrix);


    printf("%d ", minimal_sum_str_num);

    return 0;
}