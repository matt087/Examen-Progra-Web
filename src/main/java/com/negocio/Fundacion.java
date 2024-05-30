package com.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.Conexion;

public class Fundacion {

	private int id;
	private String name;
	private String telefono;
	private String direccion;
	private String representante;
	
	public Fundacion(int id, String name, String telefono, String direccion, String representante) {
		this.id = id;
		this.name = name;
		this.telefono = telefono;
		this.direccion = direccion;
		this.representante = representante;
	}
	
	public Fundacion() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getRepresentante() {
		return representante;
	}
	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public String comboFundaciones()
	{
		String combo="<select class='input_izq' name=\"cmbFundaciones\" required oninvalid=\"this.setCustomValidity('No hay Fundaciones Ingresadas')\">";
		String sql="SELECT id_fu, nombre_fu FROM tb_fundaciones";
		ResultSet rs=null;
		Conexion con=new Conexion();
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
			}
			combo+="</select>";
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return combo;
	}
	
	public String crearTablaSuministros(int id_fundacion)
	{
		String sentencia="SELECT tb_fun_al.id_fun_al, nombre_al, tb_fun_al.cantidad_al FROM tb_fun_al, tb_alimentos WHERE tb_fun_al.id_al = tb_alimentos.id_al AND id_fu="+id_fundacion;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Nombre del Suministro</th><th scope=\"col\">Cantidad Disponible</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getInt(3)+"</td>"
						+"</tr>";
			}
			tabla+="</tbody></table>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}
	
	public String getNombreById(int id)
	{
		String sql="SELECT nombre_fu FROM tb_fundaciones WHERE id_fu="+id;
		ResultSet rs=null;
		Conexion con=new Conexion();
		String nombre="";
		try
		{
			rs=con.Consulta(sql);
			while(rs.next())
			{
				nombre=rs.getString(1);			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return nombre;
	}
	
	public String crearTabla()
	{
		String sentencia="SELECT * FROM tb_fundaciones ORDER BY id_fu";
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Nombre de la Fundación</th><th scope=\"col\">Teléfono</th><th scope=\"col\">Dirección</th><th scope=\"col\">Representante Legal</th><th scope=\"col\">Edición</th><th scope=\"col\">Eliminación</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				int cod = rs.getInt(1);
				String nombre = rs.getString(2);
				tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "<td>"+rs.getString(5)+"</td>"
						+"<td><a class='valido' href=\"modificar_fundacion.jsp?codigo="+cod+"&nombre="+nombre+"\">Modificar</a></td>"
						+"<td><a class='valido' onclick=\"confirmar("+cod+", '"+nombre+"')\">Eliminar</a></td></tr>";
			}
			tabla+="</tbody></table>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}
	
	public String ingresarFundacion(int id, String nombre, String telefono, String direccion, String representante)
	{
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_fundaciones (id_fu, nombre_fu,"
				+ "telefono_fu, direccion_fu, representante_fu) "
				+ "VALUES(?,?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setString(2,nombre);
			pr.setString(3, telefono);
			pr.setString(4, direccion);
			pr.setString(5, representante);
			if(pr.executeUpdate()==1)
			{
				result="Inserción correcta";
			}
			else
			{
				result="Error en inserción";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
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

	public int getNewId()
	{
		String sentencia="SELECT id_fu FROM tb_fundaciones";
		Conexion con=new Conexion();
		ResultSet rs=null;
		int aux=0, mayor=0;
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				aux = rs.getInt(1);
				if(aux > mayor)
					mayor = aux;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return mayor+1;
	}
	
	public boolean eliminarFundacion(int codigo)
	{
		boolean eliminado = false;
		Conexion con=new Conexion();
		String sql = "DELETE FROM tb_fundaciones WHERE id_fu="+codigo;
		try 	
		{
			con.Ejecutar(sql);
			eliminado = true;
		} 
		catch (Exception e) 
		{
			eliminado=false;
			System.out.print(e.getMessage());
		}
		return eliminado;
	}
	
	public void modificarFundacion(int codigo)
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT id_fu, nombre_fu, telefono_fu, direccion_fu, representante_fu FROM tb_fundaciones WHERE id_fu="+codigo;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				this.setId(rs.getInt(1));
				this.setName(rs.getString(2));
				this.setTelefono(rs.getString(3));
				this.setDireccion(rs.getString(4));
				this.setRepresentante(rs.getString(5));
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
	}

	public boolean editarInfo(Fundacion f)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_fundaciones SET id_fu="+f.getId()+", nombre_fu='"+f.getName()+"', telefono_fu='"
				+f.getTelefono()+"', direccion_fu='"+f.getDireccion()+"', representante_fu='"+f.getRepresentante()+"' WHERE id_fu="+f.getId();
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
	
	public boolean editarStock(int cantidad, int id_fun_al)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_fun_al SET cantidad_al=cantidad_al+"+cantidad+" WHERE id_fun_al="+id_fun_al;
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
