<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Shopping.MainAdmin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--  --%>

     <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <%-- <img  style="width:50%;" src="images/adm.png" />--%>
                            
                                    <i class="fas fa-user-shield logo"></i>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3 class="heading">Admin Panel</h3>                       
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12" >
                                  <div class="row">
                         
                            <div class="form-group col-md-4">
                                       <b><label class="labels">Category Id:</label></b>
                                    <asp:TextBox CssClass="form-control text" ID="cat_id" runat="server" placeholder="Category Id.."  Height="31px" Width="100%" Visible="True" ReadOnly="True"></asp:TextBox>                                 
                                    </div>   
                            <div class="form-group col-md-8">
                                    <b><label class="labels">Category Name:</label></b>
                          <asp:TextBox ID="txt1" CssClass="form-control text" runat="server" placeholder="Category Name.." Height="31px" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt1" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            
                            </div> 
                        </div>
                         <div class="row">
                                <div class="form-group col-md-12">
                                    <b><label class="labels">Category Description:</label></b>
                          <asp:TextBox ID="txt2" CssClass="form-control text" runat="server" placeholder="Description.."  Width="100%" TextMode="Multiline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please Fill" ControlToValidate="txt2" Display="Dynamic" Font-Bold="True" Font-Names="Times New Roman" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>                                                                                                 
                                </div>                                   
                        </div>                        
                        <div class="row">
                             <div class="form-group col-md-12">
                                <asp:Button class="btn btn-warning btn-block btn-mg letter" ID="Button3" runat="server" Text="Add Category" Font-Bold="True" OnClick="Button3_Click1" />
                                
                             </div> 

                        </div>

                            </div>
                        </div>
                       
                        </div>                 
                         
                        </div>
                            </div>
                                                         
                        </div>
                    </div>
    <%--  --%>
</asp:Content>
