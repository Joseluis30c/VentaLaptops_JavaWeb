package Entidad;

public class EntidadDistrito {
	private int id;
    private String nomdis;

    public EntidadDistrito() {
    }

    public EntidadDistrito(int id, String nomdis) {
        this.id = id;
        this.nomdis = nomdis;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomdis() {
        return nomdis;
    }

    public void setNomdis(String nomdis) {
        this.nomdis = nomdis;
    }
    
}
