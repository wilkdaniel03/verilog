#include <stdio.h>

#define BUF_SIZE 1024

int main(void) {
    FILE *fptr = fopen("./comparator/input.txt","r");
    char buf[BUF_SIZE];
    while(fgets(buf,BUF_SIZE,fptr)) {
        printf("%s",buf);
    }
    return 0;
}
