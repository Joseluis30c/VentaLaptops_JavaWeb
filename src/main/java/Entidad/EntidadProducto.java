package Entidad;

public class EntidadProducto {
	private int idpro;
    private String nompro;
    private int cat;
    private int marca;
    private Double pre;
    private String imgpro;
    private String estado;
    
    private String nomarc;

    public EntidadProducto() {
    }

    public EntidadProducto(int idpro, String nompro, int cat, int marca, Double pre, String imgpro, String estado, String nomarc) {
        this.idpro = idpro;
        this.nompro = nompro;
        this.cat = cat;
        this.marca = marca;
        this.pre = pre;
        this.imgpro = imgpro;
        this.estado = estado;
        this.nomarc = nomarc;
    }
    
    public String getNomarc() {
        return nomarc;
    }

    public void setNomarc(String nomarc) {
        this.nomarc = nomarc;
    }
    
    public int getIdpro() {
        return idpro;
    }

    public void setIdpro(int idpro) {
        this.idpro = idpro;
    }

    public String getNompro() {
        return nompro;
    }

    public void setNompro(String nompro) {
        this.nompro = nompro;
    }

    public int getCat() {
        return cat;
    }

    public void setCat(int cat) {
        this.cat = cat;
    }

    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }

    public Double getPre() {
        return pre;
    }

    public void setPre(Double pre) {
        this.pre = pre;
    }

    public String getImgpro() {
        return imgpro;
    }

    public void setImgpro(String imgpro) {
        this.imgpro = imgpro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
