# Compiler Settings
CC = gcc 
CFLAGS = -Wall # Enable all compilation warning 

AR = ar # Static library
PIC = -fPIC

#Classes
MAIN_CLASS = main.c
ADV_LOOP_CLASS = advancedClassificationLoop.c
ADV_REC_CLASS = advancedClassificationRecursion.c
BASIC_CLASS = basicClassification.c

#Header
HEADERCLASS = NumClass.h 

#Objects
OBJ_MAIN = main.o
OBJ_REC = advancedClassificationRecursion.o
OBJ_LOOP = advancedClassificationLoop.o
OBJ_BASIC = basicClassification.o

#Satic Librarys
STATIC_REC_LIB = libclassrec.a
STATIC_LOOP_LIB = libclassloops.a

#Dynamic Librarys
DYNAMIC_REC_LIB = libclassrec.so
DYNAMIC_LOOP_LIB =  libclassloops.so

#Program
PROGRAM_ST_LOOPS = loops
PROGRAM_ST_REC = recursives
PROGRAM_DY_REC = recursived
PROGRAM_DY_LOOPS = loopd
PROGRAM_ST_REC_MAIN = mains
PROGRAM_DY_REC_MAIN = maindrec
PROGRAM_DY_LOOPS_MAIN = maindloop


#Default target
all: $(PROGRAM_ST_REC_MAIN) $(PROGRAM_DY_REC_MAIN) $(PROGRAM_DY_LOOPS_MAIN) $(PROGRAM_ST_LOOPS) $(PROGRAM_DY_LOOPS) $(PROGRAM_ST_REC) $(PROGRAM_DY_REC) 

#Programs Rules
# make mains program using recursion static library
$(PROGRAM_ST_REC_MAIN): $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_REC_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_ST_REC_MAIN) $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_REC_LIB)

# make maindrec program using recursion static library
$(PROGRAM_DY_REC_MAIN): $(OBJ_MAIN) $(OBJ_BASIC) $(DYNAMIC_REC_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_DY_REC_MAIN) $(OBJ_MAIN) $(OBJ_BASIC) ./$(DYNAMIC_REC_LIB)

# make maindloop program using recursion static library
$(PROGRAM_DY_LOOPS_MAIN): $(OBJ_MAIN) $(OBJ_BASIC) $(DYNAMIC_LOOP_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_DY_LOOPS_MAIN) $(OBJ_MAIN) $(OBJ_BASIC) ./$(DYNAMIC_LOOP_LIB)

# make loops program with static library
$(PROGRAM_ST_LOOPS): $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_LOOP_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_ST_LOOPS) $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_LOOP_LIB)

# make loopd program with dynamic library
$(PROGRAM_DY_LOOPS): $(OBJ_MAIN) $(OBJ_BASIC) $(DYNAMIC_LOOP_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_DY_LOOPS) $(OBJ_MAIN) $(OBJ_BASIC) ./$(DYNAMIC_LOOP_LIB)

# make recursives program with static library
$(PROGRAM_ST_REC): $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_REC_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_ST_REC) $(OBJ_MAIN) $(OBJ_BASIC) $(STATIC_REC_LIB)

# make recursived program with dynamic library
$(PROGRAM_DY_REC): $(OBJ_MAIN) $(OBJ_BASIC) $(DYNAMIC_REC_LIB)
	$(CC) $(CFLAGS) -o $(PROGRAM_DY_REC) $(OBJ_MAIN) $(OBJ_BASIC) ./$(DYNAMIC_REC_LIB)


#Dynamic Librarys "so" files
$(DYNAMIC_LOOP_LIB): $(OBJ_LOOP)
	$(CC) -shared -o $(DYNAMIC_LOOP_LIB) $(OBJ_LOOP)

$(DYNAMIC_REC_LIB): $(OBJ_REC)
	$(CC) -shared -o $(DYNAMIC_REC_LIB) $(OBJ_REC)

#Static Librarys "a" files
$(STATIC_LOOP_LIB): $(OBJ_LOOP)
	$(AR) -rcs $(STATIC_LOOP_LIB) $(OBJ_LOOP)

$(STATIC_REC_LIB): $(OBJ_REC)
	$(AR) -rcs $(STATIC_REC_LIB) $(OBJ_REC)

#Objects "o" files
$(OBJ_LOOP): $(ADV_LOOP_CLASS) $(HEADERCLASS)
	$(CC) $(CFLAGS) -c $(ADV_LOOP_CLASS)

$(OBJ_REC): $(ADV_REC_CLASS) $(HEADERCLASS)
	$(CC) $(CFLAGS) -c $(ADV_REC_CLASS)

$(OBJ_BASIC): $(BASIC_CLASS) $(HEADERCLASS)
	$(CC) $(CFLAGS) -c $(BASIC_CLASS)

$(OBJ_MAIN): $(MAIN_CLASS) $(HEADERCLASS)
	$(CC) $(FLAGS) -c $(MAIN_CLASS)


#Removing files
.PHONY: clean all

clean:
	rm -f *.o *.a *.so loops loopd recursives recursived mains maindloop maindrec

