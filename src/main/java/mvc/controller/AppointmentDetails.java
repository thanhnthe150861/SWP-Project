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
                List<Doctor> doctors = staffDBContext.getDoctorBySpecialty(bookingID.getBooking().getSpecialty_id());
                session.setAttribute("doctors", doctors);
                if (account.getIsAdmin() == 0) {
                    req.getRequestDispatcher("view/admin/admin-appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 1) {
                    req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 2) {
                    req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
                } else if (account.getIsAdmin() == 3) {
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
        String bid = req.getParameter("bid");
        String did = req.getParameter("did");
        String status = req.getParameter("status");
        if (Integer.parseInt(did) == 0 && !status.equalsIgnoreCase("Canceled")) {
            req.setAttribute("messError", "Bạn chưa chọn bác sĩ khám");
            req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
            return;
        }
        String diseaseGroup = req.getParameter("diseaseGroup");
        String note = req.getParameter("note");
        String textReason = req.getParameter("textReason");
        if (account.getIsAdmin() == 2) {
            patientDBContext.updateBookingStatus(bid, status, textReason);
            MedicalRecord bookingID = doctorDBContext.getTTByBookingID(bid);
            session.setAttribute("bookingID", bookingID);
            req.setAttribute("messSuccess", "Cập nhật thành công");
            req.getRequestDispatcher("view/patient/appointment-details.jsp").forward(req, resp);
            return;
        }
        if (account.getIsAdmin() == 0 || account.getIsAdmin() == 1 || account.getIsAdmin() == 3) {
            //
            if (Integer.parseInt(did) != 0) {
                DayOff dayOff = stb.getDayOffByDoctorID(did);
                if (dayOff != null) {
                    MedicalRecord bookingIDs = doctorDBContext.getTTByBookingID(bid);
                    int comp = bookingIDs.getBooking().getDate().compareTo(dayOff.getDate());
                    if (comp == 0 && dayOff.getSlot().getId() == bookingIDs.getBooking().getSlots().getId()) {
                        req.setAttribute("messError", "Bác sĩ bạn chọn vắng mặt vào ca này");
                        req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
                        return;
                    }
                    if (comp == 0 && dayOff.getSlot().getId() == 0) {
                        req.setAttribute("messError", "Bác sĩ bạn chọn đã nghỉ vào ngày này");
                        req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
                        return;
                    }
                }
            }
            //
            if (status.equalsIgnoreCase("Canceled") && Integer.parseInt(did) == 0) {
                stb.updateBookingStatusCancel(bid, diseaseGroup, status, textReason, note);
            } else {
                stb.updateBookingStatus(bid, did, diseaseGroup, status, textReason, note);
            }
            MedicalRecord bookingID = doctorDBContext.getTTByBookingID(bid);
            session.setAttribute("bookingID", bookingID);
            req.setAttribute("messSuccess", "Cập nhật thành công");
            if (account.getIsAdmin() == 0) {
                req.getRequestDispatcher("view/admin/admin-appointment-details.jsp").forward(req, resp);
            }
            req.getRequestDispatcher("view/staff/staff-appointment-details.jsp").forward(req, resp);
        }
    }
}
