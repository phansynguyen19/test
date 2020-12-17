/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.cart.Cart;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SumPriceServlet", urlPatterns = {"/SumPriceServlet"})
public class SumPriceServlet extends HttpServlet {

    private final String ONLINE_STORE_PAGE = "onlineStore.jsp";
    private final String ONLINE_STORE_SERVLET = "OnlineStoreServlet";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ONLINE_STORE_SERVLET;
        try {
            float sum = 0.0f;
            HttpSession session = request.getSession(false);
            if (session != null) {
                ServletContext context = request.getServletContext();
                if(context != null) {
                    Cart cart = new Cart();
                cart = (Cart) session.getAttribute("CART");
                
                if (cart != null) {
                    Map<String, Integer> items;
                    items = cart.getItems();
                    Map<String, Float> prices;
                    prices = (Map<String, Float>) context.getAttribute("LIST_ITEM");
                    
                    for (String title : items.keySet()) {
                        for (String price : prices.keySet()) {
                            if (title.equals(price)) {
                                sum += items.get(title) * prices.get(price);
                            }
                        }
                    }
                }
                }
                
                session.setAttribute("SUM", sum);
                url = "checkOut.jsp";
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
