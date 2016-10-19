using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sport
{
    class Buf
    {
        List<List<string>> History;

        public Buf()
        {
            History = new List<List<string>>();
        }

        public void AddRulesInHistory(List<string> newRule)
        {
            History.Add(newRule);
        }
    }
}
