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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AppointmentDetails", value = "/appointment_details")
public class AppointmentDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        PatientDBContext patientDBContext = new PatientDBContext();
        DoctorDBContext doctorDBContext = new DoctorDBContext();
        StaffDBContext staffDBContext = new StaffDBContext();
        List<Specialty> listSp = patientDBContext.getAllSpecialties();
        session.setAttribute("listSp", listSp);
        String bid = req.getParameter("bid");
        if (account != null) {
            if (bid != null) {
                session.setAttribute("bid", bid);
                MedicalRecord bookingID = doctorDBContext.getTTByBookingID(bid);
                session.setAttribute("bookingID", bookingID);
                if (account.getIsAdmin() == 0) {
                    req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 1) {
                    req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 2) {
                    req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 3) {
                    List<Doctor> doctors = staffDBContext.getDoctorBySpecialty(bookingID.getBooking().getSpecialty_id());
                    session.setAttribute("doctors", doctors);
                    req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
                }
            }
        }
        req.getRequestDispatcher("login");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        PatientDBContext patientDBContext = new PatientDBContext();
        DoctorDBContext doctorDBContext = new DoctorDBContext();
        StaffDBContext stb = new StaffDBContext();
        DoctorDBContext dbContext = new DoctorDBContext();
        String bid = req.getParameter("bid");
        String did = req.getParameter("did");
        String diseaseGroup = req.getParameter("diseaseGroup");
        String note = req.getParameter("note");
        String textReason = req.getParameter("textReason");
        String status = req.getParameter("status");
        if (account.getIsAdmin() == 2) {
            patientDBContext.updateBookingStatus(bid, status, textReason);
            MedicalRecord bookingID = doctorDBContext.getTTByBookingID(bid);
            session.setAttribute("bookingID", bookingID);
            req.setAttribute("messSuccess", "Cập nhật thành công");
            req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
            return;
        }
        if (account.getIsAdmin() == 0 || account.getIsAdmin() == 1 || account.getIsAdmin() == 3) {
            stb.updateBookingStatus(bid, did, diseaseGroup, status, textReason, note);
            MedicalRecord bookingID = doctorDBContext.getTTByBookingID(bid);
            session.setAttribute("bookingID", bookingID);
            req.setAttribute("messSuccess", "Cập nhật thành công");
            req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
        }
    }
}
