using ConsoleApp22.Persistence;

namespace ConsoleApp22.Business
{
    /// <summary>
    /// Categoriza trades com base em estratégias definidas.
    /// </summary>
    public class TradeCategorizer
    {
        private readonly TradeCategoryStrategyFactory _strategyFactory;

        /// <summary>
        /// Inicializa uma nova instância do categorizador de trades.
        /// </summary>
        public TradeCategorizer(TradeCategoryStrategyFactory strategyFactory)
        {
            _strategyFactory = strategyFactory ?? throw new ArgumentNullException(nameof(strategyFactory));
        }

        /// <summary>
        /// Categoriza uma lista de trades com base nas estratégias disponíveis.
        /// </summary>
        /// <param name="trades">A lista de trades a serem categorizados.</param>
        /// <returns>Uma lista de strings representando as categorias dos trades.</returns>
        public List<string> CategorizeTrades(List<ITrade> trades)
        {
            var categories = new List<string>();

            foreach (var trade in trades)
            {
                var strategy = _strategyFactory.GetStrategy(trade);
                if (strategy != null)
                {
                    categories.Add(strategy.Category);
                }
                else
                {
                    // Tratar trades que não se encaixam em nenhuma categoria conhecida.
                    categories.Add("UNKNOWN");
                }
            }

            return categories;
        }
    }
}
