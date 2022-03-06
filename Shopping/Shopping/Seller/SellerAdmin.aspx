<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerDashboard.Master" AutoEventWireup="true" CodeBehind="SellerAdmin.aspx.cs" Inherits="Shopping.Seller.SellerAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
        <%--Bootstrap Form --%>
     <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <%-- <img  style="width:50%;" src="images/adm.png" />--%>
                            
                                    <i class="fas fa-users logo"></i>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Seller Panel</h3>
                        
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                       <b><label class="labels">Product Id:</label></b>
                                    <asp:TextBox CssClass="form-control text" ID="Product_id" runat="server" placeholder="Product Id.."  Height="31px" Width="100%" Visible="True" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                <div class="form-group col-md-6">
                                    <b><label class="labels">Product Category:</label></b>
                                     
                                  
                                        <asp:DropDownList CssClass="form-control drop" ID="DropDownList1" runat="server" Font-Bold="True" Width="100%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  AutoPostBack="True" >
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Select Category Type" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ControlToValidate="DropDownList1" ToolTip="Name" ForeColor="Red" SetFocusOnError="True" InitialValue="Select Category"></asp:RequiredFieldValidator>                                 
                     
                                        </div>                                                                 
                                       <div class="form-group col-md-3">
                                       <b><label class="labels">Category Id:</label></b>
                                    <asp:TextBox CssClass="form-control text" ID="cat_id" runat="server" placeholder="Category Id.."  Height="31px" Width="100%" Visible="True" ReadOnly="True"></asp:TextBox>                                 
                                    </div>                                                             
                        </div>
                        <div class="row">
                                <div class="form-group col-md">
                                    <b><label class="labels">Product Name:</label></b>
                          <asp:TextBox ID="txt1" CssClass="form-control text" runat="server" placeholder="Product Name.." Height="31px" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt1" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>  
                         
                        </div>

                         <div class="row">
                                <div class="form-group col-md-6">
                                    <b><label class="labels">Product Price:</label></b>
                          <asp:TextBox ID="txt2" CssClass="form-control text" runat="server" placeholder="Product Price.." Height="31px" Width="100%" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt2" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt2" Display="Dynamic" ErrorMessage="* Enter 123.." Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                                </div>     
                              <div class="form-group col-md-6">
                                    <b><label class="labels">Product Stock:</label></b>
                          <asp:TextBox ID="txt3" CssClass="form-control text" runat="server" placeholder="Product Stock.." Height="31px" Width="100%" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt3" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt3" Display="Dynamic" ErrorMessage="* Enter 123.." Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                                </div>  
                        </div>
                          <div class="row">
                                <div class="form-group col-md">
                                    <b><label class="labels">Product Description:</label></b>
                          <asp:TextBox ID="txt4" CssClass="form-control text" runat="server" placeholder="Product Description.." Width="100%" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt4" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                
                          
                                </div>  
                              </div>
                         <div class="row">
                                <div class="form-group col-md">
                                    <b><label class="labels">Product Image:</label></b>

                                            
                                    <asp:FileUpload ID="f1" runat="server"  Width="100%" /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Please Select Image" ControlToValidate="f1" Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="!!Only images (.jpg, .png, .gif and .bmp) can be uploaded" ControlToValidate="f1" Font-Bold="True" Font-Names="Times New Roman" SetFocusOnError="True" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

                                
                          
                                   

                                
                          
                                </div>  
                              </div>
                        </div>
                 
                                <div class="row">                              
                                    <div class="form-group col-md">
                                <asp:Button class="btn btn-success btn-block btn-mg letter" ID="Button3" runat="server" Text="Add Product" Font-Bold="True" OnClick="b1_Click"  />
                                </div>  
                               
                              </div> 
                       
                        </div>
                            </div>
                                                         
                        </div>
      

                   
                 
             
                    </div>
               
    <%-- ====================================== --%>

     <script>  
        function alertme() {
            swal("Data Inserted", "Successfully", "success");
        }    
         function alertmeEx() {
            swal("Some Exception", "Plz Refresh Page", "error");

        }
         function alertmeup() {
            swal("Data Uptated", "Successfully", "success");

        } 
         function alertmedel() {
            swal("Data Deleted", "Successfully", "success");

        } 
           </script>
    </asp:Content>
