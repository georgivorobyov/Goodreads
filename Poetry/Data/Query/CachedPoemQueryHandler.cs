using Poetry.Data.Model;
using System;
using System.Collections.Generic;
using System.Web;

namespace Poetry.Data.Query
{
    public class CachedPoemQueryHandler : IQueryHandler<PoemQueryModel, PoemModel>
    {
        private readonly object lockObject;

        private readonly IQueryHandler<PoemQueryModel, PoemModel> queryHandler;
        private readonly Dictionary<int, PoemModel> poemsCache;

        public CachedPoemQueryHandler(IQueryHandler<PoemQueryModel, PoemModel> poemQueryHandler)
        {
            poemsCache = new Dictionary<int, PoemModel>();
            queryHandler = poemQueryHandler;
        }

        public PoemModel Execute(PoemQueryModel query)
        {
            PoemModel result;
            if (!poemsCache.TryGetValue(query.PoemId, out result))
            {
                result = queryHandler.Execute(query);
                lock (lockObject)
                    poemsCache[query.PoemId] = result;
            }
            return result;
        }
    }
}