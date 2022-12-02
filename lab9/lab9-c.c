// choi++20201118 lab9-c call assembly function from c

int readnum();
int printnum();

int main() {
    int a, b, c, d, e, op, res;
    int i;

    a = readnum();
    b = readnum();
    c = readnum();
    d = readnum();
    e = readnum();
    op = readnum();

    switch (op) {
        case 1:
            res = a + b;
            break;
        case 2:
            res = a + b + c;
            break;
        case 3:
            res = a + b - c;
            break;
        case 4:
            res = a - b + c - d;
            break;
        default:
            res = a - b + c + d + e;
    }

    res = printnum(res);
    printnum(res);
}

