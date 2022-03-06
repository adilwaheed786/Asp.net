<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerDashboard.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Shopping.Seller.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
         <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                            <i class="fas fa-boxes logo"></i>
                                    
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Inventory</h3>
                        
                        </center>
                            </div>
                        </div>
                      <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <%--  --%>

                         <div class="row">
                            <div class="col">
                                <div class="input-group ">
                                    <asp:TextBox ID="search" AutoPostBack="true" class="form-control rounded pl-3"   placeholder="Search" aria-label="Search" aria-describedby="search-addon"  runat="server"></asp:TextBox>
                                    <asp:Button ID="searchbtn" class="btn btn-outline-primary" runat="server" Text="Search" OnClick="searchbtn_Click" />
                                    
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        
                        <%--  --%>
                        <div class="row">
                            <div class="table-responsive" >
                                           <asp:GridView ID="GridView1" runat="server"
                 
                                               AutoGenerateColumns="False" 
                        OnRowDeleting="GridView1_RowDeleting"
                        DataKeyNames="Product_id"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                        OnRowEditing="GridView1_RowEditing" 
                        OnRowUpdating="GridView1_RowUpdating"
                                               EmptyDataText="No Record Found"
                        OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging" CellSpacing="2"
                                   CssClass="table table-striped"                  

                                               >

                        <Columns>
                             <asp:TemplateField HeaderText="Id">
                                <%-- <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Product_id") %>' ReadOnly="False"></asp:TextBox>
                                 </EditItemTemplate>--%>
                                 <ItemTemplate>
                                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("Product_id") %>'></asp:Label>
                                 </ItemTemplate>
                            </asp:TemplateField>

                           <%-- <asp:TemplateField HeaderText="Cat_Id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cat_id") %>' ReadOnly="True"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cat_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Seller_Id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Seller_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Seller_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>

                         

                            <asp:TemplateField HeaderText="Category" SortExpression="Cat_name">
                    <EditItemTemplate>
                        <div class="form-group">   
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" >
                        <asp:ListItem>Select Category</asp:ListItem>
                  
                    </asp:DropDownList>
                        </div>
                    
               <asp:RequiredFieldValidator ValidationGroup="Grid"  ID="RequiredFieldValidator45" runat="server" Text="*" ErrorMessage="*Select Category Type" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="DropDownList2" ToolTip="Name" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Category"></asp:RequiredFieldValidator>                                                     
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Labelca" runat="server" Text='<%# Bind("Cat_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                             <asp:TemplateField HeaderText="Product_Name">
                                 <EditItemTemplate>
                                     <div class="form-group">  
                                     <asp:TextBox CssClass="form-control" ID="name" runat="server" width="150px" Text='<%# Bind("Pr_name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator  ValidationGroup="Grid" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Fill" ControlToValidate="name" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         
                                     </div>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label8" runat="server" Text='<%# Bind("Pr_name") %>'></asp:Label>
                                 </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Image">
                                  <EditItemTemplate>
                                      <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="240px" />
                              <asp:RequiredFieldValidator ValidationGroup="Grid" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please Select Image" ControlToValidate="FileUpload1" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                  </EditItemTemplate>
                                 <ItemTemplate>
                         <asp:Image ID="ImageP" runat="server" Height="80px" Width="80px"
                             ImageUrl='<%# "data:Image/png;base64,"
                              + Convert.ToBase64String((byte[])Eval("Pr_image")) %>' />
                         </ItemTemplate>
                </asp:TemplateField>

                            <asp:TemplateField HeaderText="Description">
                                <EditItemTemplate>
                                    <div class="form-group">   
                                        <asp:TextBox ID="prd" runat="server" CssClass="form-control" TextMode="MultiLine" Width="150px" Text='<%# Bind("Pr_description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Grid" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Fill" ControlToValidate="prd" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"  Text='<%# Bind("Pr_description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price">
                                <EditItemTemplate>
                                    <div class="form-group">   
                                    <asp:TextBox ID="price" runat="server" TextMode="Number" CssClass="form-control" width="80px" Text='<%# Bind("Price") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ValidationGroup="Grid" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Please Fill" ControlToValidate="price" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Grid" ID="RegularExpressionValidator4" runat="server" ControlToValidate="price" Display="Dynamic" ErrorMessage="* Enter 123.." Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                                    </div>
                                        </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stock">
                                <EditItemTemplate>
                                     <div class="form-group"> 
                                    <asp:TextBox ID="stock" runat="server" TextMode="Number" CssClass="form-control" width="80px" Text='<%# Bind("Stock") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ValidationGroup="Grid" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Please Fill" ControlToValidate="stock" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Grid" ID="RegularExpressionValidator6" runat="server" ControlToValidate="stock" Display="Dynamic" ErrorMessage="* Enter 123.." Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                                     </div>
                                         </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:Button CommandName="Delete" runat="server" CssClass="btn btn-danger" CausesValidation="false" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ValidationGroup="Grid"  ControlStyle-CssClass="btn btn-warning">
                               
                    <ControlStyle CssClass="btn btn-warning">

                                    </ControlStyle>
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
         </asp:GridView>

        </div>
                        </div>

                        </div>
                 
                           
                       
                        </div>
                            </div>
                                                         
                        </div>
      

                   
                 
             
                    </div>
        <%--  CssClass="table table-bordered table-condensed table-responsive table-hover" --%>
       <%-- ========================--%>

       
      <%--==================================--%>
     
</asp:Content>
