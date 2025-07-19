package Controllers.Vendor;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import Services.BookServiceImp;
import Services.IBookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Vendor/Book/Insert")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class InsertBookController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final IBookService service = new BookServiceImp();

    // Thư mục cố định lưu trữ ảnh upload
    private static final String UPLOAD_DIR = "src/main/webapp/uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Vendor/form-add-san-pham.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ form
            String title = req.getParameter("title");
            String author = req.getParameter("author");
            String category = req.getParameter("category");
            String longDescription = req.getParameter("long_description");
            int discountPercentage = parseIntOrDefault(req.getParameter("discount_percentage"), 0);
            int stock = parseIntOrDefault(req.getParameter("stock"), 0);
            int price = parseIntOrDefault(req.getParameter("price"), 0);

            String imageUrl = null;

            // Tạo thư mục nếu chưa tồn tại
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Xử lý ảnh
            Part part = req.getPart("image_file");
            if (part != null && part.getSize() > 0) {
                // Lưu ảnh vào thư mục cố định
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                File file = new File(uploadDir, fileName);
                part.write(file.getAbsolutePath());
                imageUrl = "uploads/" + fileName;
            } else {
                // Nếu không có file upload, sử dụng link ảnh từ form
                String imageLink = req.getParameter("image_link");
                if (imageLink != null && !imageLink.trim().isEmpty()) {
                    imageUrl = imageLink.trim();
                }
            }

            // Thêm sách vào database
            boolean isSuccess = service.insert(title, author, imageUrl, discountPercentage, stock, category, price, longDescription);

            if (isSuccess) {
                req.setAttribute("message", "Sản phẩm đã được thêm thành công!");
            } 

            req.getRequestDispatcher("/Vendor/form-add-san-pham.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.getRequestDispatcher("/Vendor/form-add-san-pham.jsp").forward(req, resp);
        }
    }

   
    private int parseIntOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
