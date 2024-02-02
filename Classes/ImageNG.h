#ifndef IMAGENG_H			
#define IMAGENG_H

#include "Dimension.h"

#include "ImageNG.h"

#include <iostream>
using namespace std;

class ImageNG
{
	private:
		int num;
		char *pnom;
		Dimension dimension;

		static const int L_MAX=400;
		static const int H_MAX=400;

		int matrice[L_MAX][H_MAX];


	public: 
		ImageNG(); //constructeur par defaut
		ImageNG(int id,const char* nom); //d'initialisation 
		ImageNG(const ImageNG& autreImage);// constructeur par copie
		ImageNG(int id,const char* nom,const Dimension& dim); //d'initialisation compple de dimension

		ImageNG(const char* nom);


		~ImageNG(); //destructeur
		
//--------------------------------------------------------------
		 void setId(int id);
		 void setNom(const char* nom);

		 void setDimension(const Dimension& dim);
		 Dimension getDimension()const;
		 
		 int getId() const;
		 const char* getNom() const;
//-------------------------------------------------------------
        int getLuminance() const;
        int getMinimum() const;
        int getMaximum() const;
        float getContraste() const;


//------------------------------------------------------------

		void Affiche()const;

//------------------------------------------------------------------
	int getPixel(int x,int y)const;
	void setPixel(int x,int y,int val);
	void setBackground(int val);
	void Dessine();
	void importFromFile(const char* fichier);
	void exportToFile(const char* fichier, const char* format);

//-----------------------------------------------------------------------------------
	friend ostream& operator<<(ostream& os, const ImageNG& autreImage);
	ImageNG& operator=(const ImageNG& autreImage);
	ImageNG operator+( int);
	friend ImageNG operator+( int,const ImageNG&);
	ImageNG operator-( int);
	friend ImageNG operator-( int,const ImageNG&);
	ImageNG operator++();
	ImageNG operator++(int);
	ImageNG operator--();
	ImageNG operator--(int);
	ImageNG operator-(const ImageNG&);//operateur pour im
        bool operator==(const ImageNG& imge2) ;
         bool operator<(const ImageNG& imge2) ;
        bool operator>(const ImageNG& imge2) ;
	
//---------------------------------------------------------------------
};
#endif


