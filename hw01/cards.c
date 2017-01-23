#include <stdio.h>
#include <stdlib.h>

#define END_CHAR 'X'
#define END_FLAG -2

/*
This function prompts the user for a card name,
and will store it in the given card_name buffer.
*/
void get_card_name(char card_name[]) {
  puts("Enter the card name: ");
  int code = scanf("%2s", card_name);
  // Found at http://stackoverflow.com/a/7271983/5224196
  if (code != 1) {
    puts("Failed to read integer.\n");
  }
}

/*
This function gets the value of the provided card
name. For face cards, this will return 10. For an
ace ('A'), this function will return 11. If the
END_CHAR is provided, this function will return 
the END_FLAG. The function will return the value
as an integer if it lies within 1-10, otherwise
will return -1
*/
int get_val(char card_name[]) {
  switch(card_name[0]) {
    case 'K':
    case 'Q':
    case 'J':
      return 10;
    case 'A':
      return 11;
    case END_CHAR:
      return END_FLAG;
    default:
    {
      int val = atoi(card_name);
      if (val < 1 || val > 10) {
        return -1;
      }
      return val;
    }
  }
}

/*
This function returns the provided count variable
incremented by either +1 or -1. If the value is 
between 3 and 6 (inclusive), the count will be 
incremented by +1, otherwise it will be incremented
by -1.
*/
int increment_count(int count, int val) {
  if (val > 2 && val < 7) {
    return count + 1;
  } else {
    return count - 1;
  }
}
  
int main()
{
  // I can't really tell what the difference between this
  // with and without optimization was.
  int x = 5;
  int y = x+1;

  printf("y: %i\n", y);

  char card_name[3];
  int count = 0;
  do {
    int val;
    get_card_name(card_name);

    val = get_val(card_name);

    if (val == -1) {
      puts("Couldn't understand that card name!");
      continue;
    }
    if (val == END_FLAG) {
      continue;
    }

    count = increment_count(count, val);

    printf("Current count: %i\n", count);
  } while (card_name[0] != END_CHAR);

  return 0;
}

