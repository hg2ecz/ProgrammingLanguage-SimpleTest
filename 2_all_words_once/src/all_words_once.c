#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// calculate hash number
unsigned int hash_calc(const char *clave) {
    unsigned int hash=0;

    for(int i=0; clave[i]; i++) {
        unsigned int c = clave[i];
        hash = ((hash << 5) + hash) ^ c;
    }
    return hash;
}

unsigned int *_local_hashset;
int _local_hashset_max;

// hashset init
void hashset_init(unsigned int *hashset) {
    _local_hashset = hashset;
    _local_hashset_max = 0;
}

// hashset insert
int hashset_insert(const char *token) {
    unsigned int hash = hash_calc(token);

    int first = 0;
    int last = _local_hashset_max-1;

    while (first <= last) {
        int middle = (first + last)/2;
        if      (_local_hashset[middle] < hash) first = middle + 1;
        else if (_local_hashset[middle] > hash) last  = middle - 1;
        else break;
    }
    if (first > last) { // not found
        memmove(&_local_hashset[first+1], &_local_hashset[first], sizeof(unsigned int)*(_local_hashset_max-first));
        _local_hashset_max++;
        _local_hashset[first] = hash;
        return 0;
    } else { // found hash ... limitation: don't check collision!
        return 1;
    }
}

void hashset_close() {

}

char *remove_dup_words(char *out, const char *s, unsigned int *hashset) {
    int outct = 0;
    char token[1000];
    int tokenct=0;
    hashset_init(hashset);
    while (*s++) {
        if (*s > ' ') {
            token[tokenct++] = *s;
        } else if (tokenct > 0) {
            token[tokenct] = '\0';
            if (!hashset_insert(token)) {
                strcpy(&out[outct], token);
                outct += tokenct;
                out[outct++] = ' ';
            }
            tokenct=0;
        }
    }
    out[outct] = '\0';
    hashset_close();
    return out;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        puts("Parameters: filename repeat_of_test");
        return 1;
    }

    char *filename = argv[1];
    int repeat = atoi(argv[2]);

    FILE *f = fopen (filename, "rb");
    if (!f) {
        perror("file open");
        return 1;
    }

    fseek (f, 0, SEEK_END);
    int length = ftell (f);
    fseek (f, 0, SEEK_SET);
    char *contents = malloc(length);
    char *out = malloc(length);
    unsigned int *hashset = malloc(sizeof(unsigned int)*length);
    if (fread (contents, 1, length, f) != length) {
        puts("fread error");
        return 1;
    }
    fclose (f);

    char *res = NULL;

    for (int i=0; i<repeat; i++) {
        res = remove_dup_words(out, contents, hashset);
    }
    if (res) printf("%s", res);
    fprintf(stderr, "C\n");
}
