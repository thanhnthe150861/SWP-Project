package mvc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.dal.DoctorDBContext;
import mvc.dal.PatientDBContext;
import mvc.dal.StaffDBContext;
import mvc.model.*;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "DayOffDetails", value = "/day_off_details")
public class DayOffDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        StaffDBContext staffDBContext = new StaffDBContext();
        PatientDBContext patientDBContext = new PatientDBContext();
        List<Slot> slotList = patientDBContext.getAllSlots();
        session.setAttribute("slotList", slotList);
        String did = req.getParameter("did");
        if (account != null) {
            if (did != null) {
                DayOff dayOff = staffDBContext.getDayOff(did);
                session.setAttribute("dayOff", dayOff);
                if (account.getIsAdmin() == 0) {
                    req.getRequestDispatcher("view/admin/dayoff-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 1) {
                    req.getRequestDispatcher("view/staff/staff-dayoff-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 3) {
                    req.getRequestDispatcher("view/staff/staff-dayoff-details.jsp").forward(req, resp);
                }
            }
        }
        req.getRequestDispatcher("login");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        StaffDBContext stb = new StaffDBContext();
        String did = req.getParameter("did");
        String date = req.getParameter("date");
        String note = req.getParameter("note");
        String slotGroup = req.getParameter("slotGroup");
        String textReason = req.getParameter("textReason");
        String status = req.getParameter("status");
        DayOff dayOff = new DayOff();
        dayOff.setId(Integer.parseInt(did));
        dayOff.setDate(Date.valueOf(date));
        dayOff.setSlot_id(Integer.parseInt(slotGroup));
        dayOff.setReason(textReason);
        dayOff.setNote(note);
        dayOff.setStatus(status);
        if (account.getIsAdmin() == 0 || account.getIsAdmin() == 1 || account.getIsAdmin() == 3) {
            stb.updateDayOff(dayOff);
            //
            DayOff dayOffs = stb.getDayOff(did);
            session.setAttribute("dayOff", dayOffs);
            req.setAttribute("messSuccess", "Cập nhật thành công");
        }
        req.getRequestDispatcher("view/staff/staff-dayoff-details.jsp").forward(req, resp);
    }
}
