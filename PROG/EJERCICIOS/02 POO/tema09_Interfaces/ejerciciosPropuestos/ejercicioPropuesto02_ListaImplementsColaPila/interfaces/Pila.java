package tema09_Interfaces.ejerciciosPropuestos.ejercicioPropuesto02_ListaImplementsColaPila.interfaces;

/***********************************************************************************************************************
 * Interfaz Cola.                                                                                                      *
 ***********************************************************************************************************************/
public interface Pila {
    /*******************************************************************************************************************
     * Método abstracto encargado de apilar elementos de tipo String.                                                  *
     *                                                                                                                 *
     * @param strCadena String a apilar.                                                                               *
     *******************************************************************************************************************/
    void push(String strCadena);

    /*******************************************************************************************************************
     * Método encargado de pop elementos de tipo String.                                                         *
     *                                                                                                                 *
     * @return Devuelve el String desapilado.                                                                          *
     *******************************************************************************************************************/
    String popPila();
}
