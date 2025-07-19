package Services;


import DAO.DTDaoImp;
import DAO.IDTDao;

@SuppressWarnings("serial")
public class DTServiceImp implements IDTService{

	IDTDao dao= new DTDaoImp();
	@Override
	public int userCount() {
		return	dao.userCount();
	}

	@Override
	public int orderCount() {
		return dao.orderCount();
	}

	@Override
	public int bookCount() {
		return dao.bookCount();
	}

	

}
