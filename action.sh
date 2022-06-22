sudo apt update -y
sudo apt install flex bison

cd compiler-project

lex lex.l
yacc yacc.y
yacc -d yacc.y
cc lex.yy.c y.tab.c -o compiler1

sudo apt update && sudo apt install gcc
gcc -S -masm=intel mytest.c -o ass_intel
gcc -o mytest_gcc mytest.c

echo
echo
echo "---------------- assembly language (gcc) --------------------"
cat ass_intel

sudo apt install llvm clang -y

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
