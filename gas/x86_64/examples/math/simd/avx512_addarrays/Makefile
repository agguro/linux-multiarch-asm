EXE  = avx512_addarrays
OBJS = main.o avx512_addarrays.o

CXX      = g++
AS       = as
CXXFLAGS = -pipe -no-pie -std=gnu++1z -Wall -Wextra -fPIC
ASFLAGS  = --64

.PHONY: all debug clean

all: $(OBJS)
	$(CXX) -no-pie -o $(EXE) $(OBJS)
	strip -s $(EXE)

debug: CXXFLAGS += -g3 -O0
debug: ASFLAGS  += -g
debug: $(OBJS)
	$(CXX) -no-pie -o $(EXE) $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f *.o $(EXE)
