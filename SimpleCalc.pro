TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        main.c \

FLEXSOURCES = dragon/lexer.l
BISONSOURCES = dragon/parser.y

OTHER_FILES +=  \
    $$FLEXSOURCES \
    $$BISONSOURCES

flexsource.input = FLEXSOURCES
flexsource.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.c
flexsource.commands = flex -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_IN}
flexsource.variable_out = SOURCES
flexsource.name = Flex Sources ${QMAKE_FILE_IN}
flexsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += flexsource

bisonsource.input = BISONSOURCES
bisonsource.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.tab.c
bisonsource.commands = bison -d -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_IN}
bisonsource.variable_out = SOURCES
bisonsource.name = Bison Sources ${QMAKE_FILE_IN}
bisonsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += bisonsource

bisonheader.input = BISONSOURCES
bisonheader.output = ${QMAKE_FILE_IN_PATH}/${QMAKE_FILE_BASE}.h
bisonheader.commands = @true
bisonheader.variable_out = HEADERS
bisonheader.name = Bison Headers ${QMAKE_FILE_IN}
bisonheader.CONFIG += target_predeps no_link

QMAKE_EXTRA_COMPILERS += bisonheader
