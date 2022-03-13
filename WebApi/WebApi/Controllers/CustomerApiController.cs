using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi.Models;
namespace WebApi.Controllers
{
    public class CustomerApiController : System.Web.Http.ApiController
    {
        shoppingv3Entities db = new shoppingv3Entities();
        [System.Web.Http.HttpGet]
        public IHttpActionResult Action()
        {
            List<Customer> obj = db.Customers.ToList();
            return Ok(obj);
        }
        [System.Web.Http.HttpGet]
        public IHttpActionResult Action(int id)
        {
            var obj = db.Customers.Where(model =>model.Cust_id==id).FirstOrDefault();
            return Ok(obj);
        }
        [System.Web.Http.HttpPost]
        public IHttpActionResult Insert(Customer ct)
        {
            db.Customers.Add(ct);
            db.SaveChanges();
            return Ok();
        }
        [System.Web.Http.HttpPut]
        public IHttpActionResult Update(Customer ct)
        {
            var obj = db.Customers.Where(model => model.Cust_id == ct.Cust_id).FirstOrDefault();
            if (ct != null)
            {
                obj.Cust_Name = ct.Cust_Name;
                obj.Cust_id = ct.Cust_id;
                obj.Address = ct.Address;
                obj.E_mail = ct.E_mail;
                obj.Password = ct.Password;
                obj.Creation_date = ct.Creation_date;
                db.SaveChanges();
            }
            else
            {
                return NotFound();
            }                    
            return Ok();
        }
        [System.Web.Http.HttpDelete]
        public IHttpActionResult CusDelete(int id)
        {
            var obj = db.Customers.Where(model => model.Cust_id == id).FirstOrDefault();
            db.Entry(obj).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return Ok();
        }
    }
}
