using Moq;
using ConsoleApp22.Business;
using ConsoleApp22.DataType;
using ConsoleApp22.Persistence;

namespace ConsoleApp22.Tests
{
    public class TradeCategorizerTests
    {
        [Fact]
        public void CategorizeTrades_ShouldCategorizeCorrectly_WithGivenStrategies()
        {
            var factory = new TradeCategoryStrategyFactory();

            var categorizer = new TradeCategorizer(factory);

            var trades = new List<ITrade>
            {
                new Trade { Value = 2000000, ClientSector = "Private" },
                new Trade { Value = 400000, ClientSector = "Public" }
            };

            var categories = categorizer.CategorizeTrades(trades);

            Assert.Contains("HIGHRISK", categories);
            Assert.Contains("LOWRISK", categories);
        }

        [Fact]
        public void AddStrategy_ShouldCorrectlyCategorizeTrade_WithNewRiskStrategy()
        {
            var factory = new TradeCategoryStrategyFactory();

            factory.AddStrategy(new CustomRiskStrategy());

            var customTrade = new Mock<ITrade>();
            customTrade.Setup(t => t.Value).Returns(400000); // Valor abaixo de $500.000
            customTrade.Setup(t => t.ClientSector).Returns("Private"); // Setor "Private"

            var strategy = factory.GetStrategy(customTrade.Object);

            Assert.NotNull(strategy);
            Assert.Equal("CUSTOMRISK", strategy.Category);
        }

        [Fact]
        public void RemoveStrategy_ShouldReturnTrue_WhenStrategyExists()
        {
            var factory = new TradeCategoryStrategyFactory();
            factory.AddStrategy(new LowRiskStrategy());
            factory.AddStrategy(new MediumRiskStrategy());
            factory.AddStrategy(new HighRiskStrategy());

            bool removeResult = factory.RemoveStrategy("MEDIUMRISK");

            Assert.True(removeResult);
        }

        [Fact]
        public void RemoveStrategy_ShouldReturnFalse_WhenStrategyDoesNotExist()
        {
            var factory = new TradeCategoryStrategyFactory();

            bool removeResult = factory.RemoveStrategy("NONEXISTENTRISK");

            Assert.False(removeResult);
        }

        [Fact]
        public void RemoveStrategy_ShouldActuallyRemoveStrategy_WhenStrategyExists()
        {
            var factory = new TradeCategoryStrategyFactory();
            var specificStrategy = new HighRiskStrategy();
            factory.AddStrategy(specificStrategy);

            factory.RemoveStrategy("HIGHRISK");

            var trade = new Mock<ITrade>();
            trade.Setup(t => t.Value).Returns(2000000); // Valor que normalmente corresponderia ao HIGHRISK
            trade.Setup(t => t.ClientSector).Returns("Private");

            var strategyAfterRemoval = factory.GetStrategy(trade.Object);

            Assert.Null(strategyAfterRemoval);
        }

        [Fact]
        public void UpdateStrategy_ShouldUpdateExistingStrategy_WhenCategoryExists()
        {
            var factory = new TradeCategoryStrategyFactory();
            factory.UpdateStrategy(new LowRiskStrategy());

            var updatedStrategy = new Mock<ITradeCategoryStrategy>();
            updatedStrategy.Setup(s => s.Category).Returns("LOWRISK");

            var wasUpdated = factory.UpdateStrategy(updatedStrategy.Object);

            Assert.True(wasUpdated); // Confirma que a estratégia existente foi atualizada.
        }

        [Fact]
        public void UpdateStrategy_ShouldAddNewStrategy_WhenCategoryDoesNotExist()
        {
            var factory = new TradeCategoryStrategyFactory();
            var newStrategy = new Mock<ITradeCategoryStrategy>();
            newStrategy.Setup(s => s.Category).Returns("NEWCATEGORY");

            var wasUpdated = factory.UpdateStrategy(newStrategy.Object);

            Assert.False(wasUpdated); // Confirma que uma nova estratégia foi adicionada, não uma atualização.
        }

    }
}