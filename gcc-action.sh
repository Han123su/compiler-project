sudo apt-get update
sudo apt-get install flex bison

mkdir final_compiler
cd final_compiler

sudo apt-get install git
git clone https://github.com/gjlmotea/Compiler-sample.git

mv mytest.c final_compiler/Compiler-sample
cd final_compiler/Compiler-sample

lex lex.l
yacc yacc.y
yacc -d yacc.y
cc lex.yy.c y.tab.c -o compiler1

echo
echo "-------------------------sample1.c-------------------------"
./compiler1 < sample1.c

echo
echo "-------------------------sample2.c-------------------------"
./compiler1 < sample2.c

echo
echo "-------------------------sample3.c-------------------------"
./compiler1 < sample3.c

echo
echo "-------------------------sample4.c-------------------------"
./compiler1 < sample4.c

echo
echo "-------------------------sample5.c-------------------------"
./compiler1 < sample5.c

echo
echo "-------------------------sample6.c-------------------------"
./compiler1 < sample6.c

echo
echo "-------------------------sample7.c-------------------------"
./compiler1 < sample7.c

echo
echo "-------------------------My program-------------------------"
./compiler1 < mytest.c

sudo apt-get update && sudo apt-get install gcc
gcc -S -masm=intel sample3.c -o ass_intel
echo
echo "(gcc) assembly language:"
cat ass_intel
