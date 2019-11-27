using HomeShoppe.DataBase;

namespace HomeShoppe.DAO
{
    public class ProductDAO
    {
        private ConnectionDBContext context = null;

        public ProductDAO()
        {
            context = new ConnectionDBContext();
        }

        public SanPham ViewDetail(int id)
        {
            return context.SanPhams.Find(id);
        }
    }
}