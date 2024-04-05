using ConsoleApp22.Persistence;

namespace ConsoleApp22.DataType
{
    /// <summary>
    /// Classe de dados para armazenamento de trades.
    /// </summary>
    public class Trade : ITrade
    {
        /// <summary>
        /// O valor monetário da negociação em dólares.
        /// </summary>
        public double Value { get; set; }

        /// <summary>
        /// O setor do cliente envolvido na negociação, podendo ser "Public" ou "Private".
        /// </summary>
        public required string ClientSector { get; set; }
    }
}
