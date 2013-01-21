package is2560;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author VigossZ
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
        
        User user = new User();
        try {
            JSONParser parser = new JSONParser();
            String username, password;
            String userid = "";
            boolean res = false;

            try {

                username = request.getParameter("username");
                password = request.getParameter("password");

                Object obj = parser.parse(new FileReader("C:\\Users\\VigossZ\\Documents\\NetBeansProjects\\IS2560FinalProject\\web\\files\\api.json"));

                JSONObject jsonObject = (JSONObject) obj;
                JSONArray userObjectarray = (JSONArray) jsonObject.get("userObject");

                for (int i = 0; i < userObjectarray.size(); i++) {
                    JSONObject eachobj = (JSONObject) userObjectarray.get(i);
                    String eachobjemail = eachobj.get("email").toString();
                    String eachobjpwd = eachobj.get("password").toString();
                    if (eachobjemail.equals(username) && eachobjpwd.equals(password)) {
                        res = true;
                        userid = eachobj.get("id").toString();
                    }
                }
                
                if (res) {
                    user.setUsername(username);
                    user.setUserid(userid);      
                    
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("home.jsp");
                    //RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
                    //rd.forward(request, response);
                    return;
                } else {
                    response.sendRedirect("error.html");
                    return;
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
