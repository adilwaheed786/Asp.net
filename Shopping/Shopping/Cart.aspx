<%@ Page Title="" Language="C#" MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Shopping.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <hr />
    <h2 style="font-family:Times New Roman; text-align: center;">
        You Have Product &nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#006666"></asp:Label>
    &nbsp;In Your Cart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ProdViews.aspx">Continue Shopping</asp:HyperLink>
&nbsp;</h2>
 <div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-8">
                <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5>

                <asp:Repeater ID="rptrCartProducts" runat="server">
                    <ItemTemplate>
                        <div class="media my-3" style="border: 1px solid #eaeaec;">
                            <div class="align-self-center mr-3">
                               <%-- <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">--%>
                                  <asp:Image ID="Image1" Height="200px" Width="200px" class="media-object img-fluid" runat="server" ImageUrl='<%# "data:Image/png;base64,"
                              + Convert.ToBase64String((byte[])Eval("Pr_image")) %>' />
                                    <%--<img width="110px" class="media-object" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">--%>
                                <%--</a>--%>
                            </div>
                            <div class="media-body">
                                <div class="container">
                                  <div class="row">
                                      
                                             <h5 class="media-heading proNameViewCart float-left"><%#Eval("Pr_name").ToString().ToUpper() %></h5>
                                      
                                 
                                  </div>
                                    <div class="row">
                                         <span class="proDescription float-left">Description : <%#Eval("Pr_description") %></span>
                                  </div>
                                 
                                    <div class="row">
                                         <span class="quantity">Quantity:<%#Eval("quantity") %></span>                                        
                                  </div>
                                 
                                      <div class="row">
                                     <span class="Price">Rs:<%#Eval("Price") %></span>
                                  </div>
                                 <div class="row">
                                     <span class="Total">Sub Total=Rs:<%#Eval("Sub_total") %></span>
                                  </div>
                                     <div class="row">
                                          <p class="proPriceSeller float-left">Seller Name : <%#Eval("Seller_name") %></p>
                                      </div>
                                     
                                    <div class="row mb-2">
                                         <asp:Button CommandArgument='<%#Eval("Product_id")+"-"+ Eval("quantity")+"-"+Eval("Seller_name")%>' ID="btnRemoveItem" OnClick="btnRemoveItem_Click" CssClass="btn btn-danger" runat="server" Text="REMOVE" />
                                  </div>
                                    
                                </div>

                               
<%--                                <div class="container">   
                                     
                                </div>
                              <div class="container"> 
                                  
                              </div>
                               
                                <p>
                                   
                                </p>--%>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-4 pt-5" runat="server" id="divPriceDetails">
                <div style="border-bottom: 1px solid #eaeaec;">
                    <h5 class="proNameViewCart">PRICE DETAILS</h5>
                    <div>
                        <label>Note:</label>
                        <span class="float-right priceGreen" id="spanDiscount" runat="server"></span>
                    </div>
                    <div>
                        <label>Sub Total</label>
                        <span class="float-right priceGray" id="spanCartTotal" runat="server"></span>
                    </div>
                      <div class="proPriceView">
                        <label>Price With Discount</label>
                        <span class="float-right priceGreen" id="Discount" runat="server"></span>
                    </div>
                </div>
                <div>
                    <div class="proPriceView">
                        <label>Total</label>
                        <span class="float-right" id="spanTotal" runat="server"></span>
                    </div>
                       
                      <div class="row form-group">
                       
                          <div class="col-sm-5">
                               <label style="font-size:17px;padding-top:10px;" >Copoun Code:</label>
                          </div>
                           <div class="col-sm-7">
                                        <asp:TextBox CssClass="form-control text" ID="TextBox2" runat="server" placeholder="Coupon Code.."  Height="25px" Width="100%"></asp:TextBox>
                                    </div>                      
                         
                    </div>
                    <div class="row form-group">
                       
                          <div class="col-sm-12">
                        <asp:Label Text="" ID="Label2" runat="server" />
                          </div>
                         
                    </div>
                              <div>
                        <span class="float-right priceAlert" id="span1" runat="server"></span>
                    </div>
                    <div>
                        <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click" CssClass="buyNowBtn" runat="server" Text="BUY NOW" />
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
