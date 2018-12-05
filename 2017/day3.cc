#include <stdio.h>

#define MIN( a, b ) ( (a) > (b) )? (b) : (a)
#define ABS( x ) ( (x) >= 0 )? (x) : -(x)

int min_list (int ll[4]) {
  int res = ll[0];
  for (int i = 1; i < 4; i++) {
    res = MIN(res, ll[i]);
  }

  return res;
}

int main () {
  int n_th_ring = 1;
  int ring_size = 8;

  int ring_min = 2;
  int ring_max = 9;

  int centres[] = {2, 4, 6, 8};
  int delta[] = {9, 11, 13, 15};

  const int RING_SIZE_INCREMENT = 8;
  const int TARGET = 277678;

  while ( !(ring_min <= TARGET && ring_max >= TARGET) ) {
    ring_min = ring_max+1;
    ring_size += RING_SIZE_INCREMENT;
    ring_max = ring_min + ring_size - 1;
    n_th_ring++;

    for (int i = 0 ; i < 4; i++) {
      centres[i] += delta[i];
      delta[i] += RING_SIZE_INCREMENT;
    }
  }

  int to_centres[] = {
    ABS(TARGET - centres[0]),
    ABS(TARGET - centres[1]),
    ABS(TARGET - centres[2]),
    ABS(TARGET - centres[3])
  };

  printf("%d\n", min_list(to_centres) + n_th_ring);

}
