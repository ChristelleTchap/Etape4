.SILENT:
objets:=./objets/
OBJ= $(objets)/ImageNG.o $(objets)/Dimension.o

all:	Test4.cpp $(objets)/ImageNG.o $(objets)/Dimension.o $(objets)/MyQT.o
	echo --- Création de Test4 ---
	g++ Test4.cpp -o Test4 MyQT.o $(OBJ) -I $(objets) -I MyQT -lSDL -lpthread -Wl,-O1 -pipe -O2 -std=gnu++11 -Wall -W -D_REENTRANT -fPIC -DQT_DEPRECATED_WARNINGS -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I. -isystem /usr/include/qt5 -isystem /usr/include/qt5/QtWidgets -isystem /usr/include/qt5/QtGui -isystem /usr/include/qt5/QtCore -I. -I. -I/usr/lib64/qt5/mkspecs/linux-g++ /usr/lib64/libQt5Widgets.so /usr/lib64/libQt5Gui.so /usr/lib64/libQt5Core.so /usr/lib64/libGL.so

$(objets)/ImageNG.o:	Classes/ImageNG.cpp Classes/ImageNG.h 
	echo --- Création de ImageNG.o ---
	g++ Classes/ImageNG.cpp -c  -I MyQT -I$(objets)
	mv ImageNG.o $(objets)

$(objets)/Dimension.o:	Classes/Dimension.cpp Classes/Dimension.h
	g++ Classes/Dimension.cpp -c -o $(objets)/Dimension.o

$(objets)/MyQT.o:	Classes/MyQT.cpp Classes/MyQT.h
	echo --- Création de MyQT.o ---
	g++ -c Classes/MyQT.cpp -IClasses -pipe -O2 -std=gnu++11 -Wall -W -D_REENTRANT -fPIC -DQT_DEPRECATED_WARNINGS -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I. -isystem /usr/include/qt5 -isystem /usr/include/qt5/QtWidgets -isystem /usr/include/qt5/QtGui -isystem /usr/include/qt5/QtCore -I. -I. -I/usr/lib64/qt5/mkspecs/linux-g++ -IClasses

clean:
	rm objets/*.o core -f
clobber:	clean
	rm Test4 -f
	