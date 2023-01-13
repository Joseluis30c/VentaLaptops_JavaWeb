package Entidad;

public class EntidadCliente {
	private int id;
    private String tipodoc;
    private String nrodoc;
    private String nombre;
    private String direc;
    private int iddis;
    private String estado;
    
    private String nomdis;

    public EntidadCliente() {
    }

    public EntidadCliente(int id, String tipodoc, String nrodoc, String nombre, String direc, int iddis, String estado, String nomdis) {
        this.id = id;
        this.tipodoc = tipodoc;
        this.nrodoc = nrodoc;
        this.nombre = nombre;
        this.direc = direc;
        this.iddis = iddis;
        this.estado = estado;
        this.nomdis = nomdis;
    }

    
    
    public String getNomdis() {
        return nomdis;
    }

    public void setNomdis(String nomdis) {
        this.nomdis = nomdis;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipodoc() {
        return tipodoc;
    }

    public void setTipodoc(String tipodoc) {
        this.tipodoc = tipodoc;
    }

    public String getNrodoc() {
        return nrodoc;
    }

    public void setNrodoc(String nrodoc) {
        this.nrodoc = nrodoc;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirec() {
        return direc;
    }

    public void setDirec(String direc) {
        this.direc = direc;
    }

    public int getIddis() {
        return iddis;
    }

    public void setIddis(int iddis) {
        this.iddis = iddis;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
