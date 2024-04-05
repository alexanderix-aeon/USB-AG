namespace ConsoleApp22.Persistence
{
    /// <summary>
    /// Define uma estratégia para categorizar trades com base em regras específicas.
    /// </summary>
    public interface ITradeCategoryStrategy
    {
        /// <summary>
        /// A categoria de risco associada à estratégia.
        /// </summary>
        string Category { get; }

        /// <summary>
        /// Determina se um trade específico corresponde à estratégia.
        /// </summary>
        /// <param name="trade">O trade a ser avaliado.</param>
        /// <returns>True se o trade corresponder à estratégia; caso contrário, false.</returns>
        bool IsMatch(ITrade trade);
    }
}
