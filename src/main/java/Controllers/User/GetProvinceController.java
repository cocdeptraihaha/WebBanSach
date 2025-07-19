package Controllers.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Models.Province;
import Services.IProvinceService;
import Services.ProvinceServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/Province")
public class GetProvinceController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IProvinceService service = new ProvinceServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Province> provinces = new ArrayList<>();
		provinces = service.getListProvince();
		req.setAttribute("provinces", provinces);
		req.getRequestDispatcher("/bootstrap5/checkout.jsp").forward(req, resp);
	}

}
