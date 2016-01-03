SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c, %.o, $(SRCS))
TARGET = shatest

CC = gcc
CFLAGS = -Wall
LDFLAGS =

all: $(TARGET)

shatest: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *~ $(OBJS) $(TARGET)

test: $(TARGET)
	./$(TARGET) -p

.PHONY: all clean test
