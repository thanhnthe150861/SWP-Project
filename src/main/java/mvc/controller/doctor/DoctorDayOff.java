package mvc.controller.doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.dal.DoctorDBContext;
import mvc.dal.PatientDBContext;
import mvc.dal.StaffDBContext;
import mvc.model.Account;
import mvc.model.Booking;
import mvc.model.DayOff;
import mvc.model.Doctor;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "DoctorDayOff", value = "/doctor_day_off")
public class DoctorDayOff extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        DoctorDBContext doctorDBContext = new DoctorDBContext();
        PatientDBContext pdb = new PatientDBContext();
        if (account != null && account.getIsAdmin() == 1) {
            Doctor doctor = doctorDBContext.getDoctor(account);
            session.setAttribute("doctor", doctor);
            String doid = req.getParameter("doid");
            String status = req.getParameter("status");
            if (doid != null && status.equals("Canceled")) {
                doctorDBContext.CancelDayOff(doid, status);
                req.setAttribute("messSuccess", "Hủy đơn thành công");
                List<DayOff> dayOffList = doctorDBContext.GetAllDayOff(doctor);
                session.setAttribute("dayOffList", dayOffList);
                req.getRequestDispatcher("view/doctor/doctor-dayoff.jsp").forward(req, resp);
                return;
            }
            List<DayOff> dayOffList = doctorDBContext.GetAllDayOff(doctor);
            session.setAttribute("dayOffList", dayOffList);
            //lấy date đã trọn, nếu ko có set mặc định ngày hôm nay
            LocalDate date = req.getParameter("datePicker") != null ? LocalDate.parse(req.getParameter("datePicker")) : LocalDate.now();
            session.setAttribute("date", date.toString());
            //lấy full slots ở db
            session.setAttribute("slotList", pdb.getAllSlots());
            // ngày chọn
            session.setAttribute("selectedSlot", req.getParameter("selectedSlot"));
            req.getRequestDispatcher("view/doctor/doctor-dayoff.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("login");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        DoctorDBContext doctorDBContext = new DoctorDBContext();
        StaffDBContext staffDBContext = new StaffDBContext();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        //Ngày chọn
        String selectedDate = req.getParameter("datePicker");
        String reasonDayOff = req.getParameter("reasonDayOff");
        String selectedSlot = session.getAttribute("selectedSlot").toString();
        //Check DayOff exist
        DayOff dayOffs = staffDBContext.checkDayOff(doctor.getId(), selectedDate);
        if (dayOffs != null) {
            req.setAttribute("messError", "Bạn đã có đơn xin nghỉ vào ngày này");
            req.getRequestDispatcher("view/doctor/doctor-dayoff.jsp").forward(req, resp);
            return;
        }
        session.removeAttribute("date");
        DayOff dayOff = new DayOff();
        dayOff.setDate(Date.valueOf(selectedDate));
        dayOff.setSlot_id(Integer.parseInt(selectedSlot));
        dayOff.setReason(reasonDayOff);
        dayOff.setStatus("Pending");
        dayOff.setDoctor(doctor);
        doctorDBContext.CreateDayOff(dayOff);
        req.setAttribute("messSuccess", "Gửi yêu cầu thành công");
        List<DayOff> dayOffList = doctorDBContext.GetAllDayOff(doctor);
        session.setAttribute("dayOffList", dayOffList);
        session.setAttribute("date", selectedDate);
        req.getRequestDispatcher("view/doctor/doctor-dayoff.jsp").forward(req, resp);
    }
}
