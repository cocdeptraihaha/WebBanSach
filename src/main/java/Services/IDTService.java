package Services;

import java.io.Serializable;


public interface IDTService extends Serializable{
	int userCount();
	int orderCount();
	int bookCount();
	
}
