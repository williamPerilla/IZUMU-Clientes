using BackIZUMIClientes.Modelos;
using System.Data.SqlClient;
using Dapper;


namespace BackIZUMIClientes.Repositorio
{
    public class Cliente : ICliente
    {
        private readonly string _connectionString;

        public Cliente(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("localDB");
        }

        public async Task<mensajes> InsertaActualizaClientes(clientes cliente)
        {
            var sp = @"dbo.spInsertaActualizaClientes";
            using var db = new SqlConnection(_connectionString);
            return await db.QueryFirstAsync<mensajes>(sp, new
            {
                @idCliente = cliente.idCliente,
                @idTipoDocumento = cliente.idTipoDocumento,
                @numeroDocumento = cliente.numeroDocumento,
                @fechaNacimiento = cliente.fechaNacimiento,
                @primerNombre = cliente.primerNombre,
                @segundoNombre = cliente.segundoNombre,
                @primerApellido = cliente.primerApellido,
                @segundoApellido = cliente.segundoApellido,
                @direccionResidencia = cliente.direccionResidencia,
                @numeroCelular = cliente.numeroCelular,
                @email = cliente.email,
                @idTipoPlan = cliente.idTipoPlan

            }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<listacombos>> ListaCombos(int opc)
        {
            var sp = @"dbo.spListaCombos";
            using var db = new SqlConnection(_connectionString);
            return await db.QueryAsync<listacombos>(sp, new { @opc = opc }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<listacliente>> ConsultaClientes(int idCliente)
        {
            var sp = @"dbo.spConsultaClientes";
            using var db = new SqlConnection(_connectionString);
            return await db.QueryAsync<listacliente>(sp, new { @idCliente = idCliente }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<mensajes> Eliminaclientes(int idCliente)
        {
            var sp = @"dbo.spEliminaClientes";
            using var db = new SqlConnection(_connectionString);
            return await db.QueryFirstAsync<mensajes>(sp, new
            {
                @idCliente = idCliente
            }, commandType: System.Data.CommandType.StoredProcedure);
        }

    }
}
