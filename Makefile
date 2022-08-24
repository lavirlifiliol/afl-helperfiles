export AFL_USE_UBSAN=1
export AFL_LLVM_CMPLOG=1
CC=afl-clang-lto
EXE=$(error forgot to set EXE)
CEXE=$(error forgot to set CEXE)

dedup:
	afl-cmin -i IN -o INU -- $(EXE)

tmin:
	sh min-all.sh $(EXE)

fuzz:
	afl-fuzz -i input -o output -c $(CEXE) -- ../$(EXE)

status:
	afl-whatsup -s output
	afl-showmap -C -i output -o /dev/null -- ./$(EXE)
