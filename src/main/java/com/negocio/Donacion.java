package com.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.datos.Conexion;

public class Donacion {
	private int id_donacion;
	private int id_usuario;
	private int id_fun_al;
	private int cantidad;
	private Date fecha;
	private Date fecha2;
	private String beneficiado;
	private int id_estado;

	public Donacion(int id_donacion, int id_usuario, int id_fun_al, int cantidad, Date fecha, Date fecha2,
			String beneficiado, int id_estado) {
		this.id_donacion = id_donacion;
		this.id_usuario = id_usuario;
		this.id_fun_al = id_fun_al;
		this.cantidad = cantidad;
		this.fecha = fecha;
		this.fecha2 = fecha2;
		this.beneficiado = beneficiado;
		this.id_estado = id_estado;
	}
	
	public Donacion( Date fecha2, String beneficiado, int id_estado) {
		this.fecha2 = fecha2;
		this.beneficiado = beneficiado;
		this.id_estado = id_estado;
	}

	
	public Donacion() {}
	
	public int getId_donacion() {
		return id_donacion;
	}
	public void setId_donacion(int id_donacion) {
		this.id_donacion = id_donacion;
	}
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public int getId_fun_al() {
		return id_fun_al;
	}
	public void setId_fun_al(int id_fun_al) {
		this.id_fun_al = id_fun_al;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public Date getFecha2() {
		return fecha2;
	}
	public void setFecha2(Date fecha2) {
		this.fecha2 = fecha2;
	}
	public String getBeneficiado() {
		return beneficiado;
	}
	public void setBeneficiado(String beneficiado) {
		this.beneficiado = beneficiado;
	}
	public int getId_estado() {
		return id_estado;
	}
	public void setId_estado(int id_estado) {
		this.id_estado = id_estado;
	}
	public boolean ingresarDonacion(int id_donacion, int id_usuario, int id_fun_al, int cantidad)
	{
		boolean resultado = false;
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_donaciones (id_don, id_us, id_fun_al, cantidad_al, fecha_don, fecha_ent, beneficiado, id_es) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try{
	        Date fechaActual = new Date();
	        java.sql.Date fechaSQL = new java.sql.Date(fechaActual.getTime());
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id_donacion);
			pr.setInt(2,id_usuario);
			pr.setInt(3,id_fun_al);
			pr.setInt(4,cantidad);
			pr.setDate(5,fechaSQL);
			pr.setDate(6,null);
			pr.setString(7,null);
			pr.setInt(8,1);

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

	public int getNewIdDonacion()
	{
		String sentencia="SELECT id_don FROM tb_donaciones";
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
	
	public String crearTablaDonaciones(int usuario)
	{
		String sentencia="SELECT tb_donaciones.id_don, tb_fundaciones.nombre_fu, tb_alimentos.nombre_al, tb_donaciones.cantidad_al,  tb_donaciones.fecha_don, tb_donaciones.fecha_ent, tb_donaciones.beneficiado, tb_estado.nombre_es FROM tb_estado, tb_fundaciones, tb_donaciones, tb_fun_al, tb_alimentos WHERE tb_donaciones.id_us = "
				+usuario+" AND tb_fun_al.id_fun_al = tb_donaciones.id_fun_al AND tb_fun_al.id_al = tb_alimentos.id_al AND tb_fun_al.id_fu = tb_fundaciones.id_fu AND tb_estado.id_es = tb_donaciones.id_es ORDER BY tb_donaciones.id_don ASC";
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Nombre de la Fundación</th><th scope=\"col\">Alimento</th><th scope=\"col\">Cantidad</th><th scope=\"col\">Fecha Donación</th><th scope=\"col\">Fecha Entrega</th><th scope=\"col\">Beneficiado</th><th scope=\"col\">Estado</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				String aux="", aux2="";
				java.sql.Date entrega = rs.getDate(6);
				String benef = rs.getString(7);
				if(entrega==null)
					aux=" - ";
				else
					aux=entrega.toString();
				if(benef==null)
					aux2=" - ";
				else
					aux2 = benef;
				tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getInt(4)+"</td>"
						+ "<td>"+rs.getDate(5)+"</td>"
						+ "<td>"+aux+"</td>"	
						+ "<td>"+aux2+"</td>"
						+ "<td>"+rs.getString(8)+"</td></tr>";
			}
			tabla+="</tbody></table>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}
	
	public String crearTablaDonaciones2()
	{
		String sentencia="SELECT tb_donaciones.id_don, tb_usuarios.nombre_us, tb_alimentos.nombre_al, tb_donaciones.cantidad_al, tb_donaciones.fecha_don, tb_donaciones.fecha_ent, tb_donaciones.beneficiado, tb_estado.nombre_es FROM tb_usuarios, tb_estado, tb_fundaciones, tb_donaciones, tb_fun_al, tb_alimentos WHERE tb_donaciones.id_us = tb_usuarios.id_us"
				+" AND tb_fun_al.id_fun_al = tb_donaciones.id_fun_al AND tb_fun_al.id_al = tb_alimentos.id_al AND tb_fun_al.id_fu = tb_fundaciones.id_fu AND tb_estado.id_es = tb_donaciones.id_es ORDER BY tb_donaciones.id_don ASC";
		Conexion con=new Conexion();
		ResultSet rs=null;
		String tabla="<table class=\"table\"><thead><tr><th scope=\"col\">ID</th><th scope=\"col\">Nombre del Donador</th><th scope=\"col\">Alimento</th><th scope=\"col\">Cantidad</th><th scope=\"col\">Fecha Donación</th><th scope=\"col\">Fecha Entrega</th><th scope=\"col\">Beneficiado</th><th scope=\"col\">Estado</th><th scope=\"col\">Actualizar</th></tr></thead><tbody><tr>";
		try 
		{
			rs=con.Consulta(sentencia);
			while(rs.next())
			{
				int cod = rs.getInt(1);
				String nombre = rs.getString(2);
				String aux="", aux2="";
				java.sql.Date entrega = rs.getDate(6);
				String benef = rs.getString(7);
				if(entrega==null)
					aux=" - ";
				else
					aux=entrega.toString();
				if(benef==null)
					aux2=" - ";
				else
					aux2 = benef;
				tabla+="<th scope=\"row\">"+rs.getInt(1)+"</th>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getInt(4)+"</td>"
						+ "<td>"+rs.getDate(5)+"</td>"
						+ "<td>"+aux+"</td>"
						+ "<td>"+aux2+"</td>"
						+ "<td>"+rs.getString(8)+"</td>"
						+"<td><a class='valido' href=\"modificar_estado.jsp?codigo="+cod+"&nombre="+nombre+"\">Actualizar</a></td></tr>";
			}
			tabla+="</tbody></table>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return tabla;
	}
	
	public void setAllInfo(int codigo)
	{
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_donaciones WHERE id_don="+codigo;
		try 
		{
			rs=con.Consulta(sql);
			while(rs.next()) 
			{
				this.setId_donacion(rs.getInt(1));
				this.setId_usuario(rs.getInt(2));
				this.setId_fun_al(rs.getInt(3));
				this.setCantidad(rs.getInt(4));
				this.setFecha(rs.getDate(5));
				this.setFecha2(rs.getDate(6));
				this.setBeneficiado(rs.getString(7));
				this.setId_estado(rs.getInt(8));
			}
		} 
		catch (SQLException e) 
		{
			System.out.print(e.getMessage());

		}
	}
	
	public boolean editarInfo(String beneficiado, int estado)
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_donaciones SET beneficiado='"+beneficiado+"', id_es="+estado+" WHERE id_don="+this.getId_donacion();
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
	
	public boolean editarFecha()
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_donaciones SET fecha_ent=CURRENT_DATE WHERE id_don="+this.getId_donacion();
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
	
	public boolean editarFecha2()
	{
		boolean ingresado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_donaciones SET fecha_ent=null WHERE id_don="+this.getId_donacion();
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
