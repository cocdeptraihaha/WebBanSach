package Services;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.TreeMap;

import Models.Order;

import java.util.List;

public class RevenueService {

    public Map<String, Integer> calculateMonthlyRevenue(List<Order> orders) {
        Map<String, Integer> monthlyRevenue = new TreeMap<>(); // Dùng TreeMap để tự động sắp xếp theo tháng

        LocalDate currentDate = LocalDate.now();
        LocalDate sixMonthsAgo = currentDate.minusMonths(6);

        for (Order order : orders) {
            LocalDate orderDate = parseOrderDate(order.getDate());
            if (orderDate != null && orderDate.isAfter(sixMonthsAgo) && orderDate.isBefore(currentDate.plusDays(1))
                && "Đã hoàn thành".equals(order.getStatus())) {
                
                String monthYear = getMonthYear(order.getDate());
                monthlyRevenue.put(monthYear, monthlyRevenue.getOrDefault(monthYear, 0) + order.getSubtotal());
            }
        }

        return monthlyRevenue;
    }

    private String getMonthYear(String date) {
        LocalDate parsedDate = parseOrderDate(date);
        return parsedDate != null ? parsedDate.format(DateTimeFormatter.ofPattern("MM/yyyy")) : "";
    }

    private LocalDate parseOrderDate(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        try {
            return LocalDate.parse(date.substring(0, 10), DateTimeFormatter.ofPattern("yyyy-MM-dd")); // Chỉ lấy phần ngày
        } catch (Exception e) {
            return null;
        }
    }

}