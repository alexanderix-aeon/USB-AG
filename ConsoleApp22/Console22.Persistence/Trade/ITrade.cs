namespace ConsoleApp22.Persistence
{
    /// <summary>
    /// Representa um trade, que é uma negociação comercial entre o banco e um cliente.
    /// </summary>
    public interface ITrade
    {
        /// <value>
        /// O valor monetário da negociação em dólares.
        /// </value>
        double Value { get; }

        /// <value>
        /// O setor do cliente envolvido na negociação, podendo ser "Public" ou "Private".
        /// </value>
        string ClientSector { get; }
    }
}
