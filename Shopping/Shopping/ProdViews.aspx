<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="ProdViews.aspx.cs" Inherits="Shopping.ProdViews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h4 class="text-center" style="font-family:Times New Roman;">Your Product In Cart Is&nbsp;
        <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Times New Roman" Font-Underline="True" NavigateUrl="~/Cart.aspx">Show Cart</asp:HyperLink>
    </h4>
    <br />
    <div class="container">   
            <div class="row">   
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <div class="thumbnail kard">
                     <asp:Image class="img-fluid proimage"  ID="ImageP" runat="server" Height="250px" Width="100%"
                             ImageUrl='<%# "data:Image/png;base64,"
                              + Convert.ToBase64String((byte[])Eval("Pr_image")) %>' />
                <%--    <div class="proName">
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Product_id") %>'>
                       
                        </asp:Label>
                    </div>--%>
                                    <div class="proName"><%#Eval("Pr_name") %></div>
                                        <div class="desc">
                                        <%#Eval("Pr_description")%></div>
                                    <div class="drp">
                                        Quantity:
                                        <asp:DropDownList ID="DropDownList1" class="btn-primary"  runat="server" Font-Bold="True" Font-Names="Times New Roman">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                                    </div>
                                    <div class="proPrice">
                                       $<%#Eval("Price")%>
                                      </div>
                                    <div class="Qty">Available Quantity:<%#Eval("Stock") %></div>
                                    <div class="sel">Seller:
                                  <asp:Label ID="Label2" class="Seller" runat="server" Text='<%#Eval("Seller_name") %>'>
                                        </asp:Label>
                                        </div>
                               <div class="button1">
                                   <asp:Button ID="Button1" class="btn btn-warning m-3" runat="server" Text="Add To Cart" Width="100%" OnClick="Button1_Click" Font-Bold="True" />
                               </div>

                             

                        <%--<div class="card-body">
                 <h5 class="card-title">Product Name:<%# Eval("Pr_name")%></h5>
                 <p class="card-text">Product Description:<%# Eval("Pr_description")%></p>
                <asp:Button ID="Button1" class="btn btn-dark btn-md" runat="server" Text="Add To Cart" Width="207px" CommandArgument='<%# Eval("Product_id") %>' CommandName="addtocart" style="text-align: center" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" />

                        </div>--%>
                </div>

            </div>
             <asp:HiddenField ID="pid"  Value='<%# Eval("Product_id") %>' runat="server" />
        </ItemTemplate>
    </asp:Repeater>
    </div>
    </div>

</asp:Content>
