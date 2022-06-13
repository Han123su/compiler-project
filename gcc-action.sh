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

sudo apt-get update && sudo apt-get install gcc
gcc -S -masm=intel mytest.c -o ass_intel


echo
echo "---------------- assembly language (gcc) --------------------"
cat ass_intel
