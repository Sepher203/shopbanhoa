using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace QuanLyShopHoa
{
    public partial class CHITIETSANPHAM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XULYDULIEU xuly = new XULYDULIEU();
            String mahoa = Request.QueryString.Get("MaH");
            SqlParameter[] pr = new SqlParameter[1];
            pr[0] = new SqlParameter("@MaH", mahoa);
            this.Repeater1.DataSource = xuly.getTable("psGetTableHoa", pr);
            this.Repeater1.DataBind();
        }
    }
}