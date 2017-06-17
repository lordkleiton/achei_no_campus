
package variaveis;

/**
 *
 * @author lord
 */

public class variaveis {
    //BD
    public static String url = "";
    public static String user = "";
    public static String driver = "";
    public static String password = "";
    
    //servletAdmin
    public static String delete = "DELETE from projeto WHERE id = ?";
    public static String insereAdmin = "INSERT INTO projeto (nome, categoria, endereco, campus, horario, site, email, facebook, descricao, tags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    //servletCriaUsuario
    public static String insereUsuario = "INSERT INTO usuario (login, email, senha) VALUES (?, ?, ?)";
    
    //servletLoginAdmin
    public static String selectAdmin = "SELECT * FROM admin";
    
    //servletLoginUsuario
    public static String selectUsuario = "SELECT * FROM usuario";
    
    //servletExibe
    public static String selectCampus = "SELECT * FROM projeto where campus = \"{0}\"";
    public static String selectGenerico = "SELECT * FROM projeto";
    public static String selectCategoria = "SELECT * FROM projeto where categoria = \"{0}\"";
    public static String selectCampusCategoria = "SELECT * FROM projeto WHERE campus = \"{0}\" AND categoria = \"{1}\"";

}
