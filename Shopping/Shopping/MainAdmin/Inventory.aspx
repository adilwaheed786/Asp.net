<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Shopping.MainAdmin.Inventory" %>
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
                           <h3 class="heading">Category Inventory</h3>
                        
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
                          CssClass="table table-striped"
                                    EmptyDataText="No Record Found"
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                    </asp:GridView>
                            </div>
                        </div>

                        </div>
                 
                           
                       
                        </div>
                            </div>
                                                         
                        </div>
      

                   
                 
             
                    </div>
    
    
  
   
</asp:Content>
