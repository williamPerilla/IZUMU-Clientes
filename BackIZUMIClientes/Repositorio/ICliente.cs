using BackIZUMIClientes.Modelos;

namespace BackIZUMIClientes.Repositorio
{
    public interface ICliente
    {
        Task<mensajes> InsertaActualizaClientes(clientes cliente);
        Task<IEnumerable<listacombos>> ListaCombos(int opc);
        Task<IEnumerable<listacliente>> ConsultaClientes(int idCliente);
        Task<mensajes> Eliminaclientes(int idCliente);
    }
}
