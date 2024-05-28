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
