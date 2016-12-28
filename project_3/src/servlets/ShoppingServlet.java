package servlets;

import java.util.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import beans.Candy;

public class ShoppingServlet extends HttpServlet {
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		//detects error in session
		if (session == null) {
			res.sendRedirect("http://localhost:8080/error.html");
		}
		Vector buylist = (Vector) session.getValue("shoppingcart");
		String action = req.getParameter("action");
		
		
		//Listens for action key words defined in forms: CHECKOUT, DELETE, ADD and CHECKOUT
		//depending on keyword, performs set action.  Note this is working on a vector of Candy beans
		if (!action.equals("CHECKOUT")) {
			if (action.equals("DELETE")) {
				String del = req.getParameter("delindex");
				int d = (new Integer(del)).intValue();
				buylist.removeElementAt(d);
			//
			//ADDING ITEM TO CART	
			} else if (action.equals("ADD")) {
				
				// any previous buys of same cd?
				boolean match = false;
				Candy aCandy = getCandy(req);
				
				//Checks for empty quantity

				if (buylist == null) {
						
					// add first cd to the cart
					buylist = new Vector(); // first order
					buylist.addElement(aCandy);
						
				} else { // not first buy	
					for (int i = 0; i < buylist.size(); i++) {
						Candy candy = (Candy) buylist.elementAt(i);
						if (candy.getProductID().equals(
								aCandy.getProductID())) {
							candy.setQuantity(candy.getQuantity()
									+ aCandy.getQuantity());
							buylist.setElementAt(candy, i);
							match = true;
						} // end of if name matches
					} // end of for
					if (!match)
						buylist.addElement(aCandy);
				}
				
			}
			if( !(buylist.isEmpty()) && buylist.size() > 0 ){
				session.putValue("shoppingcart", buylist);
				String url = "/Cart.jsp";
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher(url);
				rd.forward(req, res);
			} else {
				session.putValue("shoppingcart", buylist);
				String url = "/CandyShop.jsp";
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher(url);
				rd.forward(req, res);
			}
		//
		// CHECKOUT	
		} else if (action.equals("CHECKOUT")) {
			float total = 0;
			for (int i = 0; i < buylist.size(); i++) {
				Candy anOrder = (Candy) buylist.elementAt(i);
				float price = anOrder.getPrice();
				int qty = anOrder.getQuantity();
				total += (price * qty);
			}
			System.out.println("Total: " + total);
			String amount = new Float(total).toString();
			req.setAttribute("amount", amount);
			String url = "/Checkout.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(req, res);
		} else {
			String url = "/CandyShop.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(req, res);
		}
	}

	//builds Candy bean to be inserted into vector from passed form values in Catalog.jsp
	private Candy getCandy(HttpServletRequest req) {
		String myCandy = req.getParameter("candy");
		String qty = req.getParameter("qty").trim();
		StringTokenizer t = new StringTokenizer(myCandy, "|");
		String id = t.nextToken().trim();
		String name = t.nextToken();
		String description = t.nextToken();
		String price = t.nextToken().trim();
		String inventoryQuantity = t.nextToken().trim();
		String inventory_id=t.nextToken().trim();
		price = price.replace('$', ' ').trim();
		Candy candy = new Candy();
		System.out.println("checking id creation: "+Integer.parseInt(id));
		candy.setProductID(Integer.parseInt(id));
		candy.setName(name);
		candy.setDescription(description);
		candy.setPrice(Float.parseFloat(price));
		candy.setQuantity(Integer.parseInt(qty));
		candy.setInventoryQuantity(Integer.parseInt(inventoryQuantity));
		candy.setInventoryID(Integer.parseInt(inventory_id));
		System.out.println("Creating candy bean: id "+candy.getProductID()+" name"+candy.getName()+" quantity"+candy.getQuantity());
		return candy;
	}

}
