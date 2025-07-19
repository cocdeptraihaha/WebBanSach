package Services;

import java.util.List;

import DAO.IProvinceDao;
import DAO.ProvinceDaoImp;
import Models.Province;

@SuppressWarnings("serial")
public class ProvinceServiceImp implements IProvinceService{

	IProvinceDao provinceDao = new ProvinceDaoImp();
			
	@Override
	public List<Province> getListProvince() {
		return provinceDao.getListProvince();
	}

}
