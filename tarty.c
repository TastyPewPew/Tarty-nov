#include <stdio.h>
#include <stdlib.h>

void flag()
{
    system("cat /root/flag.txt");
}

void register_name()
{
    char buffer[16];
    printf("Entrez votre nom:\n");
    scanf("%s", buffer);
    printf("Je ne te connais pas, %s\n", buffer);
}

int main()
{
    register_name();
    return 0;
}
