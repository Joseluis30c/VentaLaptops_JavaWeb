package Entidad;

public class EntidadCategoria {
	 int idcat;
	    String nomcat;

	    public EntidadCategoria() {
	    }

	    public EntidadCategoria(int idcat, String nomcat) {
	        this.idcat = idcat;
	        this.nomcat = nomcat;
	    }

	    public int getIdcat() {
	        return idcat;
	    }

	    public void setIdcat(int idcat) {
	        this.idcat = idcat;
	    }

	    public String getNomcat() {
	        return nomcat;
	    }

	    public void setNomcat(String nomcat) {
	        this.nomcat = nomcat;
	    }
}
