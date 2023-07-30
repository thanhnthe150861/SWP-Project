package mvc.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.dal.StaffDBContext;
import mvc.model.DayOff;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DayOffDoctor", value = "/day_off_doctor")
public class DayOffDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        StaffDBContext staffDBContext = new StaffDBContext();
        List<DayOff> dayOffList = staffDBContext.getAllDayOff();
        session.setAttribute("dayOffList", dayOffList);
        req.getRequestDispatcher("view/admin/dayoff-doctor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
