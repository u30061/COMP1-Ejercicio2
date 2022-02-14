package josq.interfaz.ventanas;

import josq.analisis.Ejercicio;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.Reader;
import java.io.StringReader;
import josq.interfaz.contenedores.*;
import josq.interfaz.controles.*;
import josq.interfaz.texto.*;

public class Principal 
{
    private JFrame1 fInicio = new JFrame1("EJERCICIO 2");;
    private JButton1 bBuscar = new JButton1("BUSCAR", 100, 26);
    private JTextArea1 aIngreso = new JTextArea1(true);
    private JScrollPane1 sIngreso = new JScrollPane1(aIngreso, 400, 160);
    private JTextArea1 aSalida = new JTextArea1(true);
    private JScrollPane1 sSalida = new JScrollPane1(aSalida, 400, 160);

    private Color cFondoTexto = new Color(20,20,20);

    void iniciar()
    {
        bBuscar.addActionListener(al1);
        fInicio.add(sIngreso);
        fInicio.add(bBuscar);
        fInicio.add(sSalida);
        fInicio.sizeSettings(false,450,420);
        fInicio.getContentPane().setBackground(cFondoTexto);
        fInicio.locationSettings();
    }

    Ejercicio resultado;

    private ActionListener al1 = new ActionListener()
    {
        @Override
        public void actionPerformed(ActionEvent event) {
            System.out.println("[BUSCAR]");
            
            Reader lector = new StringReader(aIngreso.getText());
            resultado = new Ejercicio(lector);
            try 
            {
                int token = 0;
                while (token != Ejercicio.YYEOF) 
                {
                    token = resultado.yylex();
                }
                
                aSalida.setText("");
                aSalida.append(resultado.getVocales());
                aSalida.append(resultado.getNumeros());
            } 
                catch (Exception error) 
                {
                    aSalida.setText("");
                    aSalida.append("[!] Tokens no reconocidos");
                }
        }
    };

    public static void main(String[] args) {
        new Principal().iniciar();;
    }
}
