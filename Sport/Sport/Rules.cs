using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;

namespace Sport
{
    public class Rule 
    {
        List<string> rule;

        private void SaveRule(List<string> newRule, AllRules allRules)
        {
            string pathFile = @"Rules" + @"\" + newRule[0] + ".txt";
            if (File.Exists(pathFile))
            {
                string caption = "Подтвердите сохранение";
                string message = "Файл с таким именем соществует. Заменить файл?";
                var result = MessageBox.Show(message, caption, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                if (result == DialogResult.No)
                {
                    MessageBox.Show("Правило с таким именем уже существует. Правило не созданно");
                }
                if (result == DialogResult.Yes)
                {
                    MessageBox.Show("Правило с таким именем изменено");
                    foreach (List<string> item in allRules.GetAllRules())
                        allRules.ChangeRule(rule);
                    File.Delete(pathFile);
                    using (FileStream fs = File.Create(pathFile))
                    {
                        foreach (string item in newRule)
                        {
                            Byte[] info = new UTF8Encoding(true).GetBytes(item + Environment.NewLine);
                            fs.Write(info, 0, info.Length);
                        }
                        fs.Close();
                    }
                }
                if (result == DialogResult.Cancel)
                {
                    //...
                }
            }
            else
            {
                MessageBox.Show("Создано новое правило");
                allRules.AddRule(newRule);
                using (FileStream fs = File.Create(pathFile))
                {
                    foreach (string item in newRule)
                    {
                        Byte[] info = new UTF8Encoding(true).GetBytes(item + Environment.NewLine);
                        fs.Write(info, 0, info.Length);
                    }
                    fs.Close();
                }
            }
        }
        public Rule (string name, string fact, AllRules allRules)
        {
            rule =  new List<string>();
            rule.Add(name);
            rule.Add(fact);
            rule.Add(true.ToString());
            rule.Add(false.ToString());
            SaveRule(rule, allRules);
        }

        public Rule (string name, string fact, string ans1, string ans2)
        {
            rule.Add(name);
            rule.Add(fact);
            rule.Add(ans1);
            rule.Add(ans2);
            //allRules.AddRule(rule);
        }

        public Rule(string name, string fact, string ans1, string ans2, string ans3)
        {
            rule.Add(name);
            rule.Add(fact);
            rule.Add(ans1);
            rule.Add(ans2);
            rule.Add(ans3);
            //allRules.AddRule(rule);
        }

        public Rule(string name, string fact, string ans1, string ans2, string ans3, string ans4)
        {
            rule.Add(name);
            rule.Add(fact);
            rule.Add(ans1);
            rule.Add(ans2);
            rule.Add(ans3);
            rule.Add(ans4);
            //allRules.AddRule(rule);
        }
    }
}
