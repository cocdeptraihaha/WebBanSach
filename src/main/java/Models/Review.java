package Models;

import java.sql.Date;

public class Review {

	private int id;
	private String username;
	private Date date;
	private String description_review;
	private int stars;
	
	public Review(String username, Date date, String description_review, int stars) {
		super();
		this.username = username;
		this.date = date;
		this.description_review = description_review;
		this.stars = stars;
	}


	public Review() {
		super();
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription_review() {
		return description_review;
	}

	public void setDecription_review(String description_review) {
		this.description_review = description_review;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}
	
	@Override
	public String toString() {
	    return "Review{" +
	            "id=" + id +
	            ", username='" + username + '\'' +
	            ", stars=" + stars +
	            ", description_review='" + description_review + '\'' +
	            ", date=" + date +
	            '}';
	}
}
