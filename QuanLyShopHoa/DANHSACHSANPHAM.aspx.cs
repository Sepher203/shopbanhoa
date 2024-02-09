using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyShopHoa
{
    public partial class DANHSACHSANPHAM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XULYDULIEU xuly = new XULYDULIEU();
            //SqlParameter[] pr = new SqlParameter[1];
            //pr[0] = new SqlParameter("@MASANPHAM", DBNull.Value);
            String MaDM = Request.QueryString.Get("MaDM");
            String SQL = "select * from Hoa WHERE MaDM=" + MaDM;

            this.DataList1.RepeatColumns = 3;
            this.DataList1.DataSource = xuly.getTable(SQL);
            this.DataList1.DataBind();
        }
    }
}