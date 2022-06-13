sudo apt-get update
sudo apt-get install flex bison

cd compiler-project

lex lex.l
yacc yacc.y
yacc -d yacc.y
cc lex.yy.c y.tab.c -o compiler1

sudo apt-get update && sudo apt-get install gcc
gcc -S -masm=intel mytest.c -o ass_intel

echo
echo
echo "---------------- assembly language (gcc) --------------------"
cat ass_intel

sudo apt-get install llvm clang

clang -S -emit-llvm mytest.c

opt -S -globalopt -loop-simplify -mem2reg mytest.ll

llc mytest.ll

echo
echo
echo "---------------- assembly language (llvm + clang) --------------------"
cat mytest.s

as mytest.s -o mytest.o

ld -o mytest -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o mytest.o -lc /usr/lib/x86_64-linux-gnu/crtn.o

echo
echo
echo "---------------------------- mytest --------------------------------"
./mytest
