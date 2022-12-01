int func(int x, int y, int z) {
    int w;
    switch(x) {
        case 1:
            w = x + y;
            break;
        case 2:
        case 5:
            w = 2 * x + y;
            break;
        case 3:
            w = y * z;
            break;
        default:
            if (y < z) w = z;
            else  w = 3;
    }
    return w;
}
