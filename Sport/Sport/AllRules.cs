using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Sport
{
    public class AllRules
    {
        public AllRules()
        {
            allRules = new List<List<string>>();
            List<string> dir = Directory.GetFiles(@"Rules", "*.txt").ToList<string>();
            foreach (string fileName in dir)
            {
                List<string> newOpenFile = System.IO.File.ReadAllLines(fileName).ToList<string>();
                AddRule(newOpenFile);
            }
        }

        List<List<string>> allRules;

        public void AddRule(List<string> newRule)
        {
            allRules.Add(newRule);
        }

        public List<List<string>> GetAllRules()
        {
            return allRules;
        }

        public List<string> GetRule(string nameRule)
        {
            List<string> newRule = new List<string>();
            foreach (List<string> item in allRules)
            {
                if (item[0] == nameRule)
                {
                    newRule = item;
                    break;
                }
            }
            return newRule;
        }

        public void ChangeRule (List<string> newRule)
        {
            int i = 0;
            foreach (List<string> item in allRules)
            {
                if (item[0] == newRule[0])
                {
                    allRules[i] = newRule;
                }
                else { i++; }
            }
        }

    }
}
