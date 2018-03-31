SRC = $(shell ls *.cpp)
BIN = $(SRC:.cpp=.out)

PKGS = OpenCL ocl-icd opencv gtkmm-3.0 zlib
CXXFLAGS = -std=c++11 -Wall -Wextra -O2 `pkg-config --cflags $(PKGS)`
LIBS = -lboost_system -lboost_filesystem `pkg-config --libs $(PKGS)`

.PHONY: all clean

all: $(BIN)

%.out: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LIBS)

clean:
	rm -f $(BIN)
