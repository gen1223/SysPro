// test logical-- disassemble

int logical(int x, int y) {
    int t1 = x^y;
    int t2 = t1 >> 17;
    int mask = (0xf << 13);
//    int mask = (0xf << 24);
    int rval = t2 & mask;
    return rval;
}

int main() {
    return (1,2);
}
