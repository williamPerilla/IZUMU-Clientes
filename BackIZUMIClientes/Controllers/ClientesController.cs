using BackIZUMIClientes.Modelos;
using BackIZUMIClientes.Repositorio;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BackIZUMIClientes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly ICliente _Cliente;
        public ClientesController(ICliente cliente)
        {
            _Cliente = cliente;
        }
       
        [HttpGet("listacombos")]
        public async Task<IActionResult> Listacombos(int opc)
        {
            try
            {
                var Resp = await _Cliente.ListaCombos(opc);
                return Ok(Resp);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error " + ex);
            }
        }

        [HttpGet("consultaclientes")]
        public async Task<IActionResult> ConsultaClientes(int idCliente)
        {
            try
            {
                var Resp = await _Cliente.ConsultaClientes(idCliente);
                return Ok(Resp);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error " + ex);
            }
        }

        [HttpPost()]
        [Route("insertaactualizacliente")]
        public async Task<IActionResult> InsertaActualizaCliente([FromBody] clientes cliente)
        {           
            try
            {
                var Resp = await _Cliente.InsertaActualizaClientes(cliente);
                return Ok(Resp);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error " + ex);
            }
        }
        
        [HttpDelete("eliminaclientes")]
        public async Task<IActionResult> Eliminaclientes([FromBody] int idCliente)
        {
            try
            {
                var Resp = await _Cliente.Eliminaclientes(idCliente);
                return Ok(Resp);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error " + ex);
            }
        }
    }
}
