export AFL_USE_UBSAN=1
export AFL_LLVM_CMPLOG=1
CC=afl-clang-lto
EXE=$(shell exit 5)
CEXE=$(shell exit 6)

dedup:
	afl-cmin -i IN -o INU -- $(EXE)

tmin:
	sh min-all.sh $(EXE)

fuzz:
	afl-fuzz -i input -o output -c $(CEXE) -- $(EXE)

