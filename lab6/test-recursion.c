// choi++20201028 test recursive procedure

#define MAX_UNTIL 1000000000
int print_dec(int num, int until)
{
  int cnt, remained, next_until;
  if(until < MAX_UNTIL && num >= (next_until = until * 10)) {
    remained = print_dec(num, next_until);
  } else {
    remained = num;
  }
  cnt = 0;
  while(remained >= until) {
    remained -= until;
    cnt++;
  }
  putchar(cnt + '0');
  return remained;
}
