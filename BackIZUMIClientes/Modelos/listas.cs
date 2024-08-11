namespace BackIZUMIClientes.Modelos
{
    public class listacliente
    {
        public int idCliente { get; set; }
        public int idTipoDocumento { get; set; }
        public string descripcionDocumento { get; set; }
        public string numeroDocumento { get; set; }
        public string fechaNacimiento { get; set; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string direccionResidencia { get; set; }
        public string numeroCelular { get; set; }
        public string email { get; set; }
        public int idTipoPlan { get; set; }
        public string descripcionPlan { get; set; }
        
    }
    public class listacombos
    {
        public int id { get; set; }
        public string descripcion { get; set; }
    }
}
