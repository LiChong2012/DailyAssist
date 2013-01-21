/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package is2560;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
public class NewsreaderDelete extends HttpServlet {

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
        try {
            
            JSONParser parser = new JSONParser();
            
            try {
                String thisUser = request.getParameter("user");
                String delRss = request.getParameter("check");
                
                Object obj = parser.parse(new FileReader("C:\\Users\\VigossZ\\Documents\\NetBeansProjects\\IS2560FinalProject\\web\\files\\api.json"));
                JSONObject jsonObject = (JSONObject) obj;
                JSONArray userObjectarray = (JSONArray) jsonObject.get("userObject");
                
                int thisObj = 0;
                for(int i = 0; i < userObjectarray.size(); i++){
                    JSONObject eachobj = (JSONObject) userObjectarray.get(i);
                    String eachobjemail = eachobj.get("email").toString();
                    if(thisUser.equals(eachobjemail)){
                        thisObj = i;
                    }
                }
                
                JSONObject firstobj = (JSONObject) userObjectarray.get(thisObj);
                JSONObject objNewsreader = (JSONObject) firstobj.get("newsreader");
                JSONArray arrBookmarks = (JSONArray) objNewsreader.get("bookmarks");
                
                int size = arrBookmarks.size();
                
                int theNum = 0;
                for(int k = 0; k < arrBookmarks.size(); k++){
                    String eachBookmark = (String) arrBookmarks.get(k);
                    if(eachBookmark.equals(delRss)){
                        theNum = k;
                    }
                }
                
                int pre = arrBookmarks.size();
                arrBookmarks.remove(theNum);
                int aft = arrBookmarks.size();
                
                FileWriter file = new FileWriter("C:\\Users\\VigossZ\\Documents\\NetBeansProjects\\IS2560FinalProject\\web\\files\\api.json");
                file.write(jsonObject.toJSONString());
                file.flush();
                file.close();
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
