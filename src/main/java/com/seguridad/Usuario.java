package com.seguridad;

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
}
