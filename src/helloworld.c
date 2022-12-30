#include <stdint.h>
#include <string.h>

#define CONSOLE (void *)0x03000000

int main(void)
{
    // 80x24 console
    uint8_t *console = CONSOLE;
    const char *message = "Hello World! compiled application!!";
    uint8_t size = strlen(message);
    for (int j = 0; j < 24; j++) {
        for (int i = 0; i < size; i++) {
            console[j * 80 + i] = message[i];
        }
    }
    return 0;
}

