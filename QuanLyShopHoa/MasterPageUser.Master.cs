using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace QuanLyShopHoa
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XULYDULIEU xuly = new XULYDULIEU();
            SqlParameter[] pr = new SqlParameter[1];
            pr[0] = new SqlParameter("@MaDM", DBNull.Value);
            this.Repeater1.DataSource = xuly.getTable("psGetTableDanhmucHoa", pr);
            this.Repeater1.DataBind();
        }
    }
}