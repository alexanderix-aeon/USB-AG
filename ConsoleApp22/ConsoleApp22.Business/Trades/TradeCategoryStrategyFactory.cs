using ConsoleApp22.Persistence;

namespace ConsoleApp22.Business
{
    /// <summary>
    /// Fábrica para criar e gerenciar estratégias de categorização de trades.
    /// </summary>
    public class TradeCategoryStrategyFactory
    {
        private readonly Dictionary<string, ITradeCategoryStrategy> _strategies;

        /// <summary>
        /// Inicializa uma nova instância da fábrica de estratégias de categoria de trade.
        /// </summary>
        public TradeCategoryStrategyFactory()
        {
            _strategies = new Dictionary<string, ITradeCategoryStrategy>();

            // Inicialização com estratégias padrão
            AddStrategy(new LowRiskStrategy());
            AddStrategy(new MediumRiskStrategy());
            AddStrategy(new HighRiskStrategy());
        }

        /// <summary>
        /// Adiciona ou atualiza uma estratégia de categorização na fábrica.
        /// </summary>
        /// <param name="strategy">A estratégia a ser adicionada ou atualizada.</param>
        public void AddStrategy(ITradeCategoryStrategy strategy)
        {
            _strategies[strategy.Category] = strategy;
        }

        /// <summary>
        /// Remove uma estratégia de categorização com base em sua categoria.
        /// </summary>
        /// <param name="category">A categoria da estratégia a ser removida.</param>
        /// <returns>True se a estratégia foi removida com sucesso; caso contrário, false.</returns>
        public bool RemoveStrategy(string category)
        {
            return _strategies.Remove(category);
        }

        /// <summary>
        /// Atualiza uma estratégia de categorização na fábrica.
        /// </summary>
        /// <param name="newStrategy">A estratégia a ser atualizada.</param>
        /// <returns></returns>
        public bool UpdateStrategy(ITradeCategoryStrategy newStrategy)
        {
            var categoryExists = _strategies.ContainsKey(newStrategy.Category);

            _strategies[newStrategy.Category] = newStrategy;

            return categoryExists;
        }

        /// <summary>
        /// Obtém a estratégia de categorização apropriada para um trade específico.
        /// </summary>
        /// <param name="trade">O trade a ser categorizado.</param>
        /// <returns>A estratégia de categorização correspondente; null se nenhuma for encontrada.</returns>
        public ITradeCategoryStrategy GetStrategy(ITrade trade)
        {
            foreach (var strategy in _strategies.Values)
            {
                if (strategy.IsMatch(trade))
                {
                    return strategy;
                }
            }
            return null; // Nenhuma estratégia corresponde
        }
    }
}
