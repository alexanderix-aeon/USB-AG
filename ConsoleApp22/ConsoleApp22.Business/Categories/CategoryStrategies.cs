using ConsoleApp22.Persistence;

namespace ConsoleApp22.Business
{
    /// <summary>
    /// Representa a estratégia da categoria com a validação de sua regra.
    /// </summary>
    public class HighRiskStrategy : ITradeCategoryStrategy
    {
        /// <summary>
        /// Descreve a categoria de risco
        /// </summary>
        public string Category => "HIGHRISK";

        /// <summary>
        /// Descreve a estratégia da categoria de risco.
        /// </summary>
        /// <param name="trade">O trade a ser avaliado.</param>
        /// <returns></returns>
        public bool IsMatch(ITrade trade) => trade.Value > 1_000_000 && trade.ClientSector == "Private";
    }

    /// <summary>
    /// Representa a estratégia da categoria com a validação de sua regra.
    /// </summary>
    public class LowRiskStrategy : ITradeCategoryStrategy
    {
        /// <summary>
        /// Descreve a categoria de risco
        /// </summary>
        public string Category => "LOWRISK";

        /// <summary>
        /// Descreve a estratégia da categoria de risco.
        /// </summary>
        /// <param name="trade">O trade a ser avaliado.</param>
        /// <returns></returns>
        public bool IsMatch(ITrade trade) => trade.Value < 1_000_000 && trade.ClientSector == "Public";
    }

    /// <summary>
    /// Representa a estratégia da categoria com a validação de sua regra.
    /// </summary>
    public class MediumRiskStrategy : ITradeCategoryStrategy
    {
        /// <summary>
        /// Descreve a categoria de risco
        /// </summary>
        public string Category => "MEDIUMRISK";

        /// <summary>
        /// Descreve a estratégia da categoria de risco.
        /// </summary>
        /// <param name="trade">O trade a ser avaliado.</param>
        /// <returns></returns>
        public bool IsMatch(ITrade trade) => trade.Value > 1_000_000 && trade.ClientSector == "Public";
    }

    /// <summary>
    /// Representa a estratégia da categoria customizada para a validação de sua regra.
    /// </summary>
    public class CustomRiskStrategy : ITradeCategoryStrategy
    {
        /// <summary>
        /// Descreve a categoria de risco
        /// </summary>
        public string Category => "CUSTOMRISK";

        /// <summary>
        /// Descreve a estratégia da categoria de risco.
        /// </summary>
        /// <param name="trade">O trade a ser avaliado.</param>
        /// <returns></returns>
        public bool IsMatch(ITrade trade) => trade.Value < 500_000 && trade.ClientSector == "Private";
    }
}
