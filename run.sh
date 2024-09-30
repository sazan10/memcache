 export CC=clang
 export CXX=clang++
 export CFLAGS="-fsanitize=thread -fPIE -fPIC -O2 -g -gcolumn-info"
 export LDFLAGS="-fsanitize=thread -pie"
 ./autogen.sh
 ./configure
 sudo sysctl vm.mmap_rnd_bits=28
 sed -i 's/^CC\s*=.*/CC = clang/' Makefile
 sed -i 's/^CXX\s*=.*/CXX = clang++/' Makefile
 sed -i 's/^CFLAGS\s*=.*/& -fsanitize=thread -fPIE -fPIC -O2 -g -gcolumn-info/' Makefile
 sed -i 's/^LDFLAGS\s*=.*/& -fsanitize=thread -pie/' Makefile
 sed -i 's/^CPP\s*=.*/CPP = clang -E/' Makefile
 make
