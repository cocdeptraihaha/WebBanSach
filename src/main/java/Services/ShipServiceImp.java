package Services;


import DAO.IShipDao;
import DAO.ShipDaoImp;

@SuppressWarnings("serial")
public class ShipServiceImp implements IShipService{

	IShipDao shipDao = new ShipDaoImp();
	
	@Override
	public int priceShip(int id) {
		return shipDao.priceShip(id);
	}

}
