using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sport
{
    class WorkClass
    {
        AllRules allRules;
        public WorkClass()
        {
            allRules = new AllRules();
        }
        
        public void OpenRule (string fact)
        {
            foreach(List<string> item in allRules.GetAllRules())
            {
                if (item[1] == fact)
                {

                }
            }
        }
    }
}
