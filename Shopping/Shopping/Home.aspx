<%@ Page Title="" Language="C#"  MasterPageFile="~/Shooping.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Shopping.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <marquee>
        <b>First In First Serves Only Top  User Discount To Come Fisrt and Buy It</b>
    </marquee>
        
    <div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
    <li data-target="#demo" data-slide-to="5"></li>
  </ul>     
  <!-- The slideshow -->
        <div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="new_images/a2.jpg" class="img-fluid" />       
    </div>
    <div class="carousel-item">
      <img src="new_images/b1.jpg" class="img-fluid" />
    </div>
    <div class="carousel-item">
     <img src="new_images/c2.png" class="img-fluid" />
    </div>
       <div class="carousel-item">
      <img src="new_images/sss1.jpg" class="img-fluid"/>
    </div>
       <div class="carousel-item">
      <img src="new_images/o1.jpg" class="img-fluid"/>
    </div>
       <div class="carousel-item">
      <img src="new_images/w1.jpg" class="img-fluid"/>
    </div>
      </div>
      
            </div>
       
  
  
  <!-- Left and right controls -->
    <div>   
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <i class="fas fa-arrow-left" aria-hidden="true"></i>    
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <i class="fas fa-arrow-right" aria-hidden="true"></i>
  </a>
        </div>
    </div>
  <%-- //////////////// --%>
    <section>
        <img src="new_images/beach.jpg" class="img-fluid"/>
   
   </section>
    <section>
        <div class="container">
  <div class="row">
     <div class="col-md-4" width="10px">
    <center>
        
     <img width="150px" height="150px" src="transparent/sho2.png" />
    <h4><b>Brown Shoe</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="far fa-star"></i> 

    </div>
    <p> <b>150 $</b></p>
         <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-warning btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
         </center>
        
    </div>
     
      <div class="col-md-4">
 <center>
        <img  width="150px" height="150px" src="transparent/cam1.png" />
    <h4><b>Canon Camera</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i> </div>
    <p> <b>500 $</b></p>
       <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-danger btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
          </center>
          
    </div>
    <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/w1.png" />
    <h4><b>Digital Watch</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>

    </div>
    <p> <b>250 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-info btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
         
    </div>
         <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/yc.png" />
    <h4><b>Chair</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>

    </div>
    <p> <b>150 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-warning btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
         <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/b2.png" />
    <h4><b>Grey Women Bag</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="far fa-star"></i>
    </div>
    <p> <b>350 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-danger btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/l1.png" />
    <h4><b>Samsung Laptop</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>750 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-info btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/rf.png" />
    <h4><b>Red Fry Pan</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>250 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-warning btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/sho4.png" />
    <h4><b>Black Shoe</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>6 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-danger btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/rm.png" />
    <h4><b>Red Mug</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>9 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-info btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/os.png" />
    <h4><b>Orange Shirt</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>30 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-warning btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/gb.png" />
    <h4><b>Green Bag</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>50 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-danger btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
       <!--!!!!!!!!!!!!!!!-->
       <div class="col-md-4">
        <center>
            <img  width="150px"  height="150px" src="transparent/m.png" />
    <h4><b>Microwave Oven</b></h4>

    <div class = "rating">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fas fa-star-half-alt"></i>

    </div>
    <p> <b>150 $</b></p>
             <a style="text-decoration:none" href="userloginpage.aspx">
        <input  class="btn btn-info btn-block btn-md"  id="Button2" type="button" value="Buy Now" />
             </a>
        </center>
    </div>
      <!--!!!!!!!!!!!!!!!-->
  </div>
     </div>
    </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 3 Primary Features </b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" img src="new_images/lll.png" />
                  <h4>Online Shooping</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" img src="new_images/ss.png" />
                  <h4>Search product</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" img src="new_images/alert.png" />
                  <h4>Defaulter List</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
         </div>
      </div>
   </section>
   <section>
      <img src="new_images/shop.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Process</h2>
                  <p><b>We have a Simple 3 Step Process</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                                  <img width="150px" src="new_images/signup.png" />
                  <h4>Sign Up</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" img src="new_images/serh2.png" />
                  <h4>Search Items</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" img src="new_images/visit.png" />
                  <h4>Visit Us</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
         </div>
      </div>
   </section>
 

</asp:Content>
