##
# Makefile to build libkm tests
##

CFLAGS := -std=c99 -Wall -Wextra -Wpedantic -D_GNU_SOURCE -g

all: test_vec test_map test_set

test_vec: test_vec.o
	$(CC) $(LDFLAGS) -o $@ $^

test_map: test_map.o
	$(CC) $(LDFLAGS) -o $@ $^

test_set: test_set.o
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

test: test_vec test_map test_set
	valgrind ./test_vec
	valgrind ./test_map
	valgrind ./test_set

clean:
	rm -f *.o test_vec test_map test_set
