# Helpers for fuzzing with afl++

the intended way use this is to append the makefile to the project makefile, compile once with  `export AFL_LLVM_CMPLOG=1` commented out, rename that file, 
set CEXE to that name, then uncomment the line and recompile, and set EXE to the name of the binary. Then collect all your seeds into a folder IN, run `make dedup tmin`
then `make fuzz`. It should probably work, but every project is different, so pay attention to what's going on
