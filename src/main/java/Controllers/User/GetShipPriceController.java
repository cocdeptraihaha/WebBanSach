package Controllers.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;

import Services.IShipService;
import Services.ShipServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User/Shipprice")
public class GetShipPriceController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	IShipService service = new ShipServiceImp();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        BufferedReader reader = req.getReader();
        StringBuilder jsonBody = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBody.append(line);
        }
        
        JSONObject jsonObject = new JSONObject(jsonBody.toString());
        int shippingMethodId = jsonObject.getInt("shippingMethod");
        
        int fee = service.priceShip(shippingMethodId);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print("{\"fee\": " + fee + "}");
        out.flush();
	}
	
}
