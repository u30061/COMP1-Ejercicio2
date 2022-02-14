package josq.analisis;

%%

%public
%class Ejercicio
%7bit
%line
%column
%int

%{
    private int vocal1 = 0;
    public int getVocal1()
    {
        return vocal1;
    }
    private void setVocal1()
    {
        vocal1 = vocal1 + 1;
    }

    private int vocal2 = 0;
    public int getVocal2()
    {
        return vocal2;
    }
    private void setVocal2()
    {
        vocal2 = vocal2 + 1;
    }

    private int vocal3 = 0;
    public int getVocal3()
    {
        return vocal3;
    }
    private void setVocal3()
    {
        vocal3 = vocal3 + 1;
    }

    private int vocal4 = 0;
    public int getVocal4()
    {
        return vocal4;
    }
    private void setVocal4()
    {
        vocal4 = vocal4 + 1;
    }

    private int vocal5 = 0;
    public int getVocal5()
    {
        return vocal5;
    }
    private void setVocal5()
    {
        vocal5 = vocal5 + 1;
    }

    public String getVocales()
    {
        return "\nPalabras con 1 vocal: " + getVocal1()+
            "\nPalabras con 2 vocales: " + getVocal2()+
            "\nPalabras con 3 vocales: " + getVocal3()+
            "\nPalabras con 4 vocales: " + getVocal4()+
            "\nPalabras con 5 vocales: " + getVocal5();
    }

    private StringBuilder numeros = new StringBuilder();
    public String getNumeros()
    {
        return numeros.toString();
    }

%}

%init{
    numeros.append("\n");
%init}

%eof{
%eof}

FINLINEA = \r|\n|\r\n
VACIO = {FINLINEA} | [ \t\f]

VOCAL = [aeiouAEIOU]
LETRA = [[a-zA-Z]--{VOCAL}]
PATRON1 = {LETRA}*
PATRON2 = {VOCAL} {PATRON1}
VOCAL1 = {PATRON1} {PATRON2}
VOCAL2 = {PATRON1} {PATRON2} {PATRON2}
VOCAL3 = {PATRON1} {PATRON2} {PATRON2} {PATRON2}
VOCAL4 = {PATRON1} {PATRON2} {PATRON2} {PATRON2} {PATRON2}
VOCAL5 = {PATRON1} {PATRON2} {PATRON2} {PATRON2} {PATRON2} {PATRON2}
NATURAL = [1-9][0-9]*
%%

{VOCAL1} {setVocal1();}
{VOCAL2} {setVocal2();}
{VOCAL3} {setVocal3();}
{VOCAL4} {setVocal4();}
{VOCAL5} {setVocal5();}

{NATURAL} { 
    numeros.append("linea="+(yyline+1)+" columna="+(yycolumn+1)+" texto="+yytext()+"\n");
    }

[^] {}

