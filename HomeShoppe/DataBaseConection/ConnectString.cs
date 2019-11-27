using System.Configuration;

namespace HomeShoppe.DataBaseConection
{
    public class ConnectString
    {
        public string ConnectionString()
        {
            return ConfigurationManager.AppSettings["StrConection"];
        }
    }
}