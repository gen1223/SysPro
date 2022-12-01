// choi++20201028 test call stack frames

int sub(int a, int b) {
    return a-b;
}

int diff(int a, int b) {
    int res = sub(a,b);
    if (res<0) 
        res = sub(b,a);
    return res;
}

int main() {
    diff(10, 12);
}
