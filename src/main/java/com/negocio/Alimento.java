package com.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.Conexion;

public class Alimento {
	private int id_alimento;
	private String descripcion_al;

	public int getId_alimento() {
		return id_alimento;
	}
	public void setId_alimento(int id_alimento) {
		this.id_alimento = id_alimento;
	}
	public String getDescripcion_al() {
		return descripcion_al;
	}
	public void setDescripcion_al(String descripcion_al) {
		this.descripcion_al = descripcion_al;
	}
	
	public boolean ingresarAlimentoxFundacion(int id_fun_al, int id_alimentos, int id_fundacion)
	{
		boolean resultado = false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_fun_al (id_fun_al, id_fu, id_al, cantidad_al) "
				+ "VALUES(?,?,?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id_fun_al);
			pr.setInt(2,id_fundacion);
			pr.setInt(3,id_alimentos);
			pr.setInt(4,0);
			if(pr.executeUpdate()==1)
			{
				resultado = true;
			}
		}
		catch(Exception ex)
		{
			ex.getMessage();
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
		return resultado;	
	}

	public boolean ingresarAlimento(int id_alimento, String nombre)
	{
		boolean result=false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_alimentos (id_al, nombre_al) "
				+ "VALUES(?,?)";
		try{
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id_alimento);
			pr.setString(2,nombre);
			if(pr.executeUpdate()==1)
			{
				result=true;
			}
		}
		catch(Exception ex)
		{
			ex.getMessage();
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
		String sentencia="SELECT id_al FROM tb_alimentos";
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
	
	public int getNewIdRelacion()
	{
		String sentencia="SELECT id_fun_al FROM tb_fun_al";
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
	
	public int countAlimentos(int id)
	{
		String sentencia="SELECT COUNT(*) FROM tb_fun_al WHERE id_fu = "+id;
		Conexion con=new Conexion();
		ResultSet rs=null;
		int contador=0;
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				contador = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return contador;
	}
	
	public String getAlimentosId(int id)
	{
		String sentencia="SELECT nombre_al, id_fun_al FROM tb_alimentos, tb_fun_al WHERE tb_alimentos.id_al = tb_fun_al.id_al AND tb_fun_al.id_fu = "+id;
		Conexion con=new Conexion();
		ResultSet rs=null;
		int contador=1;
		String lista="<div class='horizontal'><table class=suministros><thead> <tr><th>Nombre</th><th>Cantidad</th> </tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				lista+="<td id='celda"+contador+"'>"+rs.getString(1)+"</td>"
						+"<input type=\"hidden\" name=\"valorCelda"+contador+"\" value=\""+rs.getInt(2)+"\">"
						+ "<td>"
						+" <input class='next' value=\"0\" type=\"number\" name=\"cantidad_producto"+contador+"\" min=\"0\">"
						+ "</td></tr>";
				contador++;
			}
			lista+="</tbody></table></div>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return lista;
	}
	
	
}
