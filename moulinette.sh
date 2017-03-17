#!/bin/sh

## VARIABLES (Script) ##

lib="libasm.so"
mouliDirectory="moulinette"
srcsDirectory="moulinette/srcs"
outputDirectory="moulinette/output"

## FUNCTIONS (Script) ##

Init(){
    rm -f $outputDirectory/*.output
    gcc $srcsDirectory/source.c -o source
    gcc -L./ -Wl,-rpath=./ $srcsDirectory/student.c -o student -lasm -fno-builtin
}

Diff(){
    echo -n "$1: "
    diff=`diff $outputDirectory/$1_source $outputDirectory/$1_student`
    if [ -n "$diff" ]
    then
	echo "KO"
	echo "$diff" > $outputDirectory/$1.output
    else
	echo "OK"
    fi
}

DeleteOutput(){
    rm -f $outputDirectory/$1_student
    rm -f $outputDirectory/$1_source
}

Terminate(){
    rm -f source student
}


if [ ! -f $lib ]
then
    echo "libasm.so not found"
    exit 1
elif [ ! -d $outputDirectory ]
then
    echo "folder moulinette/output not found"
    exit 1
elif [ ! -d $srcsDirectory ]
then
    echo "folder moulinette/srcs not found"
    exit 1
fi

Init

## BASE FUNCTIONS (ASM) ##
echo -e "Base functions:\n"

# strlen #
./source strlen "" > $outputDirectory/strlen_source 2> /dev/null
./source strlen "Bonjour nicolas" >> $outputDirectory/strlen_source 2> /dev/null
./student strlen "" > $outputDirectory/strlen_student 2> /dev/null
./student strlen "Bonjour nicolas" >> $outputDirectory/strlen_student 2> /dev/null

Diff strlen
DeleteOutput strlen

# strchr #
./source strchr "je suis gentil" "g" > $outputDirectory/strchr_source 2> /dev/null
./source strchr "je suis gentil" "w" >> $outputDirectory/strchr_source 2> /dev/null
./source strchr "" "w" >> $outputDirectory/strchr_source 2> /dev/null
./source strchr "" "" >> $outputDirectory/strchr_source 2> /dev/null
./source strchr "je suis gentil" "" >> $outputDirectory/strchr_source 2> /dev/null
./student strchr "je suis gentil" "g" > $outputDirectory/strchr_student 2> /dev/null
./student strchr "je suis gentil" "w" >> $outputDirectory/strchr_student 2> /dev/null
./student strchr "" "w" >> $outputDirectory/strchr_student 2> /dev/null
./student strchr "" "" >> $outputDirectory/strchr_student 2> /dev/null
./student strchr "je suis gentil" "" >> $outputDirectory/strchr_student 2> /dev/null

Diff strchr
DeleteOutput strchr

# memset #
./source memset "     " "a" 3 > $outputDirectory/memset_source 2> /dev/null
./source memset "     " "a" 6 >> $outputDirectory/memset_source 2> /dev/null
./source memset "     " "a" 0 >> $outputDirectory/memset_source 2> /dev/null
./source memset "" "a" 0 >> $outputDirectory/memset_source 2> /dev/null
./source memset "" "" 0 >> $outputDirectory/memset_source 2> /dev/null
./source memset "" "" 3 >> $outputDirectory/memset_source 2> /dev/null
./student memset "     " "a" 3 > $outputDirectory/memset_student 2> /dev/null
./student memset "     " "a" 6 >> $outputDirectory/memset_student 2> /dev/null
./student memset "     " "a" 0 >> $outputDirectory/memset_student 2> /dev/null
./student memset "" "a" 0 >> $outputDirectory/memset_student 2> /dev/null
./student memset "" "" 0 >> $outputDirectory/memset_student 2> /dev/null
./student memset "" "" 3 >> $outputDirectory/memset_student 2> /dev/null

Diff memset
DeleteOutput memset

# memcpy #
./source memcpy "     " "hello" 5 > $outputDirectory/memcpy_source 2> /dev/null
./source memcpy "  /" "hello" 2 >> $outputDirectory/memcpy_source 2> /dev/null
./source memcpy "" "" 0 >> $outputDirectory/memcpy_source 2> /dev/null
./student memcpy "     " "hello" 5 > $outputDirectory/memcpy_student 2> /dev/null
./student memcpy "  /" "hello" 2 >> $outputDirectory/memcpy_student 2> /dev/null
./student memcpy "" "" 0 >> $outputDirectory/memcpy_student 2> /dev/null

Diff memcpy
DeleteOutput memcpy

# strcmp #
./source strcmp "je suis moi" "je suis moi" > $outputDirectory/strcmp_source 2> /dev/null
./source strcmp "je suis moi" "tu es toi" >> $outputDirectory/strcmp_source 2> /dev/null
./source strcmp "je suis moi" "ah bon ?" >> $outputDirectory/strcmp_source 2> /dev/null
./source strcmp "" "ah bon ?" >> $outputDirectory/strcmp_source 2> /dev/null
./source strcmp "je suis moi" "" >> $outputDirectory/strcmp_source 2> /dev/null
./student strcmp "je suis moi" "je suis moi" > $outputDirectory/strcmp_student 2> /dev/null
./student strcmp "je suis moi" "tu es toi" >> $outputDirectory/strcmp_student 2> /dev/null
./student strcmp "je suis moi" "ah bon ?" >> $outputDirectory/strcmp_student 2> /dev/null
./student strcmp "" "ah bon ?" >> $outputDirectory/strcmp_student 2> /dev/null
./student strcmp "je suis moi" "" >> $outputDirectory/strcmp_student 2> /dev/null

Diff strcmp
DeleteOutput strcmp

# memmove #
./source memmove "     " "hello" 5 > $outputDirectory/memmove_source 2> /dev/null
./source memmove "  /" "hello" 2 >> $outputDirectory/memmove_source 2> /dev/null
./source memmove "" "" 5 >> $outputDirectory/memmove_source 2> /dev/null
./source memmove "" "" 0 >> $outputDirectory/memmove_source 2> /dev/null
./student memmove "     " "hello" 5 > $outputDirectory/memmove_student 2> /dev/null
./student memmove "  /" "hello" 2 >> $outputDirectory/memmove_student 2> /dev/null
./student memmove "" "" 5 >> $outputDirectory/memmove_student 2> /dev/null
./student memmove "" "" 0 >> $outputDirectory/memmove_student 2> /dev/null

Diff memmove
DeleteOutput memmove

## COMPARISON FUNCTIONS (ASM) ##
echo -e "\nComparison functions:\n"

# strncmp #
./source strncmp "je suis moi" "je suis" 8 > $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "je suis moi" "je hello" 3 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "" "je hello" 3 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "je suis moi" "" 3 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "" "" 3 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "" "" 0 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "je suis moi" "je hello" 0 >> $outputDirectory/strncmp_source 2> /dev/null
./source strncmp "toto" "totototo" 4 >> $outputDirectory/strncmp_source 2> /dev/null
./student strncmp "je suis moi" "je suis" 8 > $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "je suis moi" "je hello" 3 >> $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "" "je hello" 3 >> $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "je suis moi" "" 3 >> $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "" "" 3 >> $outputDirectory/strncmp_student 2> /dev/null
./source strncmp "" "" 0 >> $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "je suis moi" "je hello" 0 >> $outputDirectory/strncmp_student 2> /dev/null
./student strncmp "toto" "totototo" 4 >> $outputDirectory/strncmp_student 2> /dev/null

Diff strncmp
DeleteOutput strncmp

# strcasecmp #
./source strcasecmp "je fais un test" "je fais un test" > $outputDirectory/strcasecmp_source 2> /dev/null
./source strcasecmp "Upper Case Test" "upper case test" >> $outputDirectory/strcasecmp_source 2> /dev/null
./source strcasecmp "tu lis vraiment ce test ?" "lapin lapin" >> $outputDirectory/strcasecmp_source 2> /dev/null
./source strcasecmp "" "lapin lapin" >> $outputDirectory/strcasecmp_source 2> /dev/null
./source strcasecmp "tu lis vraiment ce test ?" "" >> $outputDirectory/strcasecmp_source 2> /dev/null
./source strcasecmp "" "" >> $outputDirectory/strcasecmp_source 2> /dev/null
./student strcasecmp "je fais un test" "je fais un test" > $outputDirectory/strcasecmp_student 2> /dev/null
./student strcasecmp "Upper Case Test" "upper case test" >> $outputDirectory/strcasecmp_student 2> /dev/null
./student strcasecmp "tu lis vraiment ce test ?" "lapin lapin" >> $outputDirectory/strcasecmp_student 2> /dev/null
./student strcasecmp "" "lapin lapin" >> $outputDirectory/strcasecmp_student 2> /dev/null
./student strcasecmp "tu lis vraiment ce test ?" "" >> $outputDirectory/strcasecmp_student 2> /dev/null
./student strcasecmp "" "" >> $outputDirectory/strcasecmp_student 2> /dev/null

Diff strcasecmp
DeleteOutput strcasecmp

# rindex #
./source rindex "hello" "l" > $outputDirectory/rindex_source 2> /dev/null
./source rindex "hello" "f" >> $outputDirectory/rindex_source 2> /dev/null
./source rindex "" "f" >> $outputDirectory/rindex_source 2> /dev/null
./source rindex "hello" "" >> $outputDirectory/rindex_source 2> /dev/null
./student rindex "hello" "l" > $outputDirectory/rindex_student 2> /dev/null
./student rindex "hello" "f" >> $outputDirectory/rindex_student 2> /dev/null
./student rindex "" "f" >> $outputDirectory/rindex_student 2> /dev/null
./student rindex "hello" "" >> $outputDirectory/rindex_student 2> /dev/null

Diff rindex
DeleteOutput rindex

## SEARCH FUNCTIONS (ASM) ##
echo -e "\nSearch functions:\n"

# strstr #
./source strstr "trouveras-tu le teemo ?" "teemo" > $outputDirectory/strstr_source 2> /dev/null
./source strstr "es-tu là ?" "teemo" >> $outputDirectory/strstr_source 2> /dev/null
./source strstr "" "teemo" >> $outputDirectory/strstr_source 2> /dev/null
./source strstr "es-tu là ?" "" >> $outputDirectory/strstr_source 2> /dev/null
./source strstr "" "" >> $outputDirectory/strstr_source 2> /dev/null
./student strstr "trouveras-tu le teemo ?" "teemo" > $outputDirectory/strstr_student 2> /dev/null
./student strstr "es-tu là ?" "teemo" >> $outputDirectory/strstr_student 2> /dev/null
./student strstr "" "teemo" >> $outputDirectory/strstr_student 2> /dev/null
./student strstr "es-tu là ?" "" >> $outputDirectory/strstr_student 2> /dev/null
./student strstr "" "" >> $outputDirectory/strstr_student 2> /dev/null

Diff strstr
DeleteOutput strstr

# strcspn #
./source strcspn "teemo is the real champ" "jklzf" > $outputDirectory/strcspn_source 2> /dev/null
./source strcspn "teemo is the real champ" " " >> $outputDirectory/strcspn_source 2> /dev/null
./source strcspn "teemo is the real champ" "tre" >> $outputDirectory/strcspn_source 2> /dev/null
./source strcspn "" "tre" >> $outputDirectory/strcspn_source 2> /dev/null
./source strcspn "teemo is the real champ" "" >> $outputDirectory/strcspn_source 2> /dev/null
./student strcspn "teemo is the real champ" "jklzf" > $outputDirectory/strcspn_student 2> /dev/null
./student strcspn "teemo is the real champ" " " >> $outputDirectory/strcspn_student 2> /dev/null
./student strcspn "teemo is the real champ" "tre" >> $outputDirectory/strcspn_student 2> /dev/null
./student strcspn "" "tre" >> $outputDirectory/strcspn_student 2> /dev/null
./student strcspn "teemo is the real champ" "" >> $outputDirectory/strcspn_student 2> /dev/null

Diff strcspn
DeleteOutput strcspn

# strpbrk #
./source strpbrk "c'est long de faire des tests" "lavd" > $outputDirectory/strpbrk_source 2> /dev/null
./source strpbrk "c'est long de faire des tests" "wzx" >> $outputDirectory/strpbrk_source 2> /dev/null
./source strpbrk "c'est long de faire des tests" "" >> $outputDirectory/strpbrk_source 2> /dev/null
./source strpbrk "" "wzx" >> $outputDirectory/strpbrk_source 2> /dev/null
./source strpbrk "" "" >> $outputDirectory/strpbrk_source 2> /dev/null
./student strpbrk "c'est long de faire des tests" "lavd" > $outputDirectory/strpbrk_student 2> /dev/null
./student strpbrk "c'est long de faire des tests" "wzx" >> $outputDirectory/strpbrk_student 2> /dev/null
./student strpbrk "c'est long de faire des tests" "" >> $outputDirectory/strpbrk_student 2> /dev/null
./student strpbrk "" "wzx" >> $outputDirectory/strpbrk_student 2> /dev/null
./student strpbrk "" "" >> $outputDirectory/strpbrk_student 2> /dev/null

Diff strpbrk
DeleteOutput strpbrk

Terminate
