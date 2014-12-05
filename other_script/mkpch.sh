
clang++ -cc1 -emit-pch -x c++-header ./stdafx.hpp -o ~/.emacs.d/stdafx.pch -I /usr/include/x86_64-linux-gnu/c++/4.8 -I /usr/include/c++/4.8 -I /usr/include/c++/4.8/i686-linux-gnu -I /usr/include/c++/4.8/backward -I /usr/lib/gcc/x86_64-linux-gnu/4.8/include -I /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed  -I/usr/include/

#(setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")
