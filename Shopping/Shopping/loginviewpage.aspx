<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="loginviewpage.aspx.cs" Inherits="Shopping.loginviewpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 147px;
        }
        .auto-style2 {
            height: 23px;
            text-align: center;
        }
        .auto-style3 {
            height: 24px;
            text-align: center;
        }
        .auto-style4 {
            color: #006666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <br />
    
    <h4 class="text-center" style="font-family:Times New Roman;">Your Product In Cart Is&nbsp;
        <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Times New Roman" Font-Underline="True" NavigateUrl="~/Addtocart.aspx">Show Cart</asp:HyperLink>
    </h4>

    <div class="row">   
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <div class="thumbnail">
                    <div >   

                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdminTableConnectionString %>" SelectCommand="SELECT * FROM [adminProduct]"></asp:SqlDataSource>
   
    
    <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="id" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <div >
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center;"><em>Product Id:<asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' Font-Bold="True"></asp:Label>
                    </em>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <h1>
                        <asp:Label ID="Label2" class="name" runat="server" Text='<%# Eval("product_name") %>' Font-Bold="True" Font-Names="Times New Roman"></asp:Label>
                            </h1>
                    </td>
                </tr>
                <tr>
                    <td class="img-container">
                        <asp:Label ID="Label3" class="descc" runat="server" Text='<%# Eval("product_desc") %>' Font-Names="Times New Roman" Font-Size="Medium" Font-Underline="True" ForeColor="#996600"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="img-container">
                        <asp:Image ID="Image1"  runat="server" Height="250px" ImageUrl='<%# Eval("product_images") %>' Width="305px" />
                    </td>
                </tr>
                <tr>
                    
                    <td class="img-container">
                        <h5><span class="auto-style4" style="font-family:'Times New Roman'">Price:$</span><asp:Label ID="Label4" runat="server" class="price" Font-Bold="True" ForeColor="#006666" Text='<%# Eval("product_price") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                        &nbsp;<asp:Label ID="Label9" runat="server" Font-Names="Bernard MT Condensed" Font-Strikeout="True" Text="$:"></asp:Label>
                            <asp:Label ID="Label10" runat="server" Font-Names="Bernard MT Condensed" Font-Strikeout="True" Text='<%# Eval("product_strike") %>'></asp:Label>
                            
                        </h5>
                    </td>
                </tr>
              
                <tr>
                    <td class="img-container">
                       <h5> <b style="font-family:'Times New Roman'">Quantity:</b></h5>
                        <asp:DropDownList ID="DropDownList1" class="btn-primary" runat="server" Font-Bold="True" Font-Names="Times New Roman">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="img-container"><strong style="font-family:'Times New Roman'">Available Qty:<asp:Label ID="Label5" runat="server" Text='<%# Eval("product_qty") %>'></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" class="btn btn-dark btn-md" runat="server" Text="Add To Cart" Width="207px" CommandArgument='<%# Eval("id") %>' CommandName="addtocart" style="text-align: center" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" />
                    </td>
                </tr>
            </table>
                </div>
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    </asp:Content>


