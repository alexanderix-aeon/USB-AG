using ConsoleApp22.Business;
using ConsoleApp22.DataType;
using ConsoleApp22.Persistence;

namespace ConsoleApp22.Presentation
{
    class Program
    {
        static void Main(string[] args)
        {
            List<ITrade> portfolio = new List<ITrade>
            {
                new Trade { Value = 2000000, ClientSector = "Private" },
                new Trade { Value = 400000, ClientSector = "Public" },
                new Trade { Value = 500000, ClientSector = "Public" },
                new Trade { Value = 3000000, ClientSector = "Public" }
            };

            TradeCategoryStrategyFactory factory = new TradeCategoryStrategyFactory();
            TradeCategorizer categorizer = new TradeCategorizer(factory);

            List<string> tradeCategories = categorizer.CategorizeTrades(portfolio);

            foreach (var category in tradeCategories)
            {
                Console.WriteLine(category);
            }
        }
    }
}
