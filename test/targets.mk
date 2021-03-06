CODEC_UNITTEST_PREFIX=CODEC_UNITTEST
CODEC_UNITTEST_SRCDIR=test
CODEC_UNITTEST_CPP_SRCS=\
	$(CODEC_UNITTEST_SRCDIR)/./simple_test.cpp\

CODEC_UNITTEST_OBJS += $(CODEC_UNITTEST_CPP_SRCS:.cpp=.o)
ifeq ($(USE_ASM), Yes)
CODEC_UNITTEST_ASM_SRCS=\

CODEC_UNITTEST_OBJS += $(CODEC_UNITTEST_ASM_SRCS:.asm=.o)
endif

OBJS += $(CODEC_UNITTEST_OBJS)
$(CODEC_UNITTEST_SRCDIR)/./simple_test.o: $(CODEC_UNITTEST_SRCDIR)/./simple_test.cpp
	$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(CODEC_UNITTEST_CFLAGS) $(CODEC_UNITTEST_INCLUDES) -c -o $(CODEC_UNITTEST_SRCDIR)/./simple_test.o $(CODEC_UNITTEST_SRCDIR)/./simple_test.cpp

codec_unittest: $(CODEC_UNITTEST_OBJS) $(LIBS) $(CODEC_UNITTEST_LIBS)
	$(CXX) -o $@  $(CODEC_UNITTEST_OBJS) $(CODEC_UNITTEST_LDFLAGS) $(CODEC_UNITTEST_LIBS) $(LDFLAGS) $(LIBS)

binaries: codec_unittest
BINARIES += codec_unittest
