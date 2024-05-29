<<<<<<< HEAD
package com.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.Conexion;

public class Usuario {

	private int id;
	private int perfil;
	private String cedula;
	private String nombre;
	private String correo;	
	private String user;
	private String clave;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}	
	
	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuarios where username_us='"+nlogin+
				"' and password_us='"+nclave+"';";
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setCorreo(rs.getString(5));
				this.setClave(rs.getString(7));
				this.setPerfil(rs.getInt(2));
				this.setNombre(rs.getString(4));
				this.setId(rs.getInt(1));
				this.setUser(rs.getString(6));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	
	public String setNombreId(int perfil)
	{
		switch (perfil) {
		case 1: 
			return "Administrador";
		case 2:
			return "Donador";
		default:
			return "Unexpected value: " + perfil;
		}
	}
	
	public String[] getInfo(int id)
	{
		String sentencia= "Select * from tb_usuarios where id_us="+id;
		String [] res = new String[7];
		String res_aux="";
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				for(int i=0; i<7; i++) {
					res_aux = rs.getString(i+1);
					res[i] = res_aux;
				}
			}
			else
			{
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return res;
	}
	
	public String passwordHidden(int tam)
	{
		String aux="";
		for(int i=0; i<tam; i++)
		{
			aux+="*";
		}
		return aux;
	}
	
	public String getPass(int id)
	{
		String sql="SELECT password_us FROM tb_usuarios WHERE id_us="+id;
		ResultSet rs=null;
		Conexion con=new Conexion();
		String pass="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				pass=rs.getString(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return pass;
	}
	
	public void modificarUser(int codigo)
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_usuarios WHERE id_us="+codigo;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				this.setId(rs.getInt(1));
				this.setPerfil(rs.getInt(2));
				this.setCedula(rs.getString(3));
				this.setNombre(rs.getString(4));
				this.setCorreo(rs.getString(5));
				this.setUser(rs.getString(6));
				this.setClave(rs.getString(7));
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
	}
	
	public boolean editarInfo(String clave)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_usuarios SET password_us='"+clave+"' WHERE id_us="+this.getId();
		try 
		{
			con.Ejecutar(sql);
			ingresado = true;
		} 
		catch (Exception e) 
		{
			ingresado = false;
			System.out.print(e.getMessage());
		}
		return ingresado;
	}
	
	public String ingresarDonador()
	{
		String result="";

		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_usuarios (id_us, id_per, cedula_us, nombre_us,"
				+ "correo_us, username_us, password_us) "
				+ "VALUES(?,?,?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,this.getId());
			pr.setInt(2, 2);
			pr.setString(3, this.getCedula());
			pr.setString(4, this.getNombre());
			pr.setString(5, this.getCorreo());
			pr.setString(6, this.getUser());
			pr.setString(7, this.getClave());
			
			if(pr.executeUpdate()==1)
			{
				result="Insercion correcta";
			}
			else
			{
				result="Error en insercion";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
			System.out.print(result);
		}
		finally
		{
			try
			{
				pr.close();
				con.getConexion().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result; 
	}

	
	public int getUsuarios()
	{
		String sql="SELECT id_us FROM tb_usuarios";
		ResultSet rs=null;
		int aux=0, valor=0;
		Conexion con=new Conexion();
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				valor=rs.getInt(1);
				if(valor>aux)
				{
					aux=valor;
				}
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return aux+1;
	}
}
=======
package com.seguridad;

import java.sql.ResultSet;

import com.datos.Conexion;

public class Usuario {

	private int id;
	private int perfil;
	private String cedula;
	private String nombre;
	private String correo;	
	private String user;
	private String clave;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}	
	
	public boolean verificarUsuario(String nlogin, String nclave)
	{
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuarios where username_us='"+nlogin+
				"' and password_us='"+nclave+"';";
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setCorreo(rs.getString(5));
				this.setClave(rs.getString(7));
				this.setPerfil(rs.getInt(2));
				this.setNombre(rs.getString(4));
				this.setId(rs.getInt(1));
				this.setUser(rs.getString(6));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
}
>>>>>>> a88634466ce084510872f8b5cf5d98fdefd08a4c
