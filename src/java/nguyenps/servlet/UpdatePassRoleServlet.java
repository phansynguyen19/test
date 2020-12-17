/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyenps.userdetail.UserDetailDAO;
import nguyenps.userdetail.UserDetailDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdatePassRoleServlet", urlPatterns = {"/UpdatePassRoleServlet"})
public class UpdatePassRoleServlet extends HttpServlet {

    private final String ERROR_PAGE = "fileNotFound.html";

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
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullName");
        String admin = request.getParameter("chkAdmin");
        String searchValue = request.getParameter("lastSearchValue");
        boolean role = false;
        if (admin != null) {
            role = true;
        }
        String url = ERROR_PAGE;
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                UserDetailDTO currentUser = (UserDetailDTO) session.getAttribute("USER");
                if (currentUser.getUsername().equals(username)) {
                    if (fullname.length() >= 2 && fullname.length() <= 50) {
                        currentUser.setFullname(fullname);
                        session.setAttribute("USER", currentUser);
                    }
                }
            }
            url = "SearchLastnameServlet?"
                    + "&txtSearchValue=" + searchValue;
            /* TODO output your page here. You may use following sample code. */
            if (password.length() >= 6 && password.length() <= 30 && fullname.length() >= 2 && fullname.length() <= 50) {
                UserDetailDAO dao = new UserDetailDAO();
                boolean result = dao.update(username, password, role, fullname);
                if (!result) {
                    url = ERROR_PAGE;
                }
            } else {
                if (password.length() < 6 || password.length() > 30) {
                    request.setAttribute("INVALID_PASSWORD", "Password is required inputted from 6 to 30 char");
                }
                if (fullname.length() < 2 || fullname.length() > 50) {
                    request.setAttribute("INVALID_FULLNAME", "Full name is required inputted from 2 to 50 char");
                }
            }
        } catch (SQLException ex) {
            log("UpdatePassRoleServlet _ SQLException : " + ex.getMessage());
        } catch (NamingException ex) {
            log("UpdatePassRoleServlet _ NamingException : " + ex.getMessage());
        } finally {
//            response.sendRedirect(url);
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
