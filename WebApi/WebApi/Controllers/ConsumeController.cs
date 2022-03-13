using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class ConsumeController : Controller
    {
        HttpClient client = new HttpClient();

        // GET: Consume
        public ActionResult Index()
        {
            List<Customer> customer = new List<Customer>();
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.GetAsync("CustomerApi");
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                var display = test.Content.ReadAsAsync<List<Customer>>();
                display.Wait();
                customer = display.Result;
            }
            return View(customer);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Customer cs)
        {
          
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.PostAsJsonAsync<Customer>("CustomerApi", cs);
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View("Create");
            
        }
        public ActionResult Details(int id)
        {
            Customer customer = null;
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.GetAsync("CustomerApi?id="+id.ToString());
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                var display = test.Content.ReadAsAsync<Customer>();
                display.Wait();
                customer = display.Result;
            }
            return View(customer);
        }

        public ActionResult Edit(int id)
        {
            Customer customer = null;
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.GetAsync("CustomerApi?id=" + id.ToString());
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                var display = test.Content.ReadAsAsync<Customer>();
                display.Wait();
                customer = display.Result;
            }
            return View(customer);
        }
        [HttpPut]
        public ActionResult Edit(Customer cs)
        {
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.PutAsJsonAsync("CustomerApi", cs);
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View("Edit");
        }
     
        [HttpDelete,ActionName("Delete")]
        public ActionResult DeleteC(int id)
        {
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.DeleteAsync("CustomerApi/"+ id.ToString());
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View("Delete");
          
        }
        public ActionResult Delete(int id)
        {
            Customer customer = null;
            client.BaseAddress = new Uri("http://localhost:64914/api/CustomerApi");
            var response = client.GetAsync("CustomerApi?id=" + id.ToString());
            response.Wait();
            var test = response.Result;
            if (test.IsSuccessStatusCode)
            {
                var display = test.Content.ReadAsAsync<Customer>();
                display.Wait();
                customer = display.Result;
            }
            return View(customer);
        }
    }
}