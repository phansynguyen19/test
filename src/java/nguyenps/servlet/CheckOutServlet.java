/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.cart.Cart;
import nguyenps.cart.CartDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {

    private final String SHOPING_DONE_PAGE = "onlineStore.html";
    private final String SUM_SERVLET = "SumPriceServlet";
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
            HttpSession session = request.getSession(false);
            if (session != null) {
                float sum = (float) session.getAttribute("SUM");
                String cusName = request.getParameter("txtCustomerName");
                String address = request.getParameter("txtCustomerAddress");
                request.setAttribute("CUSNAME", cusName);
                request.setAttribute("ADDRESS", address);
                if (cusName.length() < 2 || cusName.length() > 50) {
                    request.setAttribute("INVALID_NAME", "Name is required inputted from 2 to 50 char");
                }
                if (address.length() < 2 || address.length() > 50) {
                    request.setAttribute("INVALID_ADDRESS", "Address is required inputted from 2 to 50 char");
                }
                if (request.getAttribute("INVALID_NAME") != null) {
                    url = SUM_SERVLET;
                } else if (request.getAttribute("INVALID_ADDRESS") != null) {
                    url = SUM_SERVLET;
                } else {
                    Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now());
                    CartDAO dao = new CartDAO();
                    dao.saveCartItemToDatabase(cusName, address, dateTime, sum);
                    dao.checkCustomer(cusName, address, sum); //set Id to save bill
                    int id = dao.getId(); //get Id to go bill and Add

                    boolean result = false;

                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        Map<String, Integer> item = cart.getItems();
                        if (item != null) {
                            for (String title : item.keySet()) {
                                int quantity = item.get(title);

                                result = dao.saveBillToDatabase(title, id, quantity);
                            }
                            session.removeAttribute("CART");
                        }
                    }

                    if (result) {
                        url = SHOPING_DONE_PAGE;
                    }
                }
            }

        } catch (SQLException ex) {
            log("CheckOutServlet _ SQLException : " + ex.getMessage());
        } catch (NamingException ex) {
            log("CheckOutServlet _ NamingException : " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
//            response.sendRedirect(url);
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
