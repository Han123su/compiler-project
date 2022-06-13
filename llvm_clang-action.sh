sudo apt-get install llvm clang

clang -S -emit-llvm mytest.c
echo
echo "---------------------mytest.ll------------------------"
cat mytest.ll
echo
opt -S -globalopt -loop-simplify -mem2reg mytest.ll

llc mytest.ll
echo
echo "---------------------mytest.s------------------------"
cat mytest.s

as mytest.s -o mytest.o

ld -o mytest -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o mytest.o -lc /usr/lib/x86_64-linux-gnu/crtn.o
echo
echo "---------------------mytest執行------------------------"
./mytest
